class ProjectsController < ApplicationController

  before_filter :authenticate_user!, :except => [:index, :show, :list, :home, :one_of_a_kind, :preorders, :search, :collection, :junglee]
  before_filter :show_pending_notification, :except => [:update_status]
  
  def new
    designer = Designer.find(params[:designer_id])
    render_404 and return if !current_user.is_admin? and designer.user_id != current_user.id
    @project = designer.projects.new
    render :layout => 'inbound_layout'
  end

  def create
    @project = Project.new(params[:project])
    if @project.save
      ProjectMailer.notify(@project).deliver
      redirect_to edit_designer_project_url(@project.designer, @project) and return
    else
      flash[:error] = 'Hey the title is important. Please think of one for the awesome design of yours.'
      redirect_to :back and return
    end
  end

  def update
    @designer = Designer.find(params[:designer_id])
    @project = Project.find(params[:id])
    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to(:back, :notice => 'Project was successfully updated.') }
        format.json { respond_with_bip(@project) }
      else
        format.html { render :action => "edit" }
        format.json { respond_with_bip(@project) }
      end
    end
  end
  
  # def index
  #   @designer = Designer.find(params[:designer_id])
  #   @projects = @designer.projects.where("status = 1")
  # end

  def list
    Project.connection.execute("select setseed(0.2)")
    taxonomies = params[:taxonomies].blank? ?  [nil] + Project::TAXONOMIES.values : params[:taxonomies]
    designers = params[:designers].blank? ?  [nil] + Designer.active.collect(&:id) : params[:designers]
    @projects = Project.where({:status => Project::ACTIVE, :taxonomy => taxonomies, :designer_id => designers})
      .order("RANDOM()").paginate(:page => params[:page], :per_page => 18)
    render :layout => 'inbound_layout'
  end

  def one_of_a_kind
    Project.connection.execute("select setseed(0.2)")
    designers = params[:designers].blank? ?  [nil] + Designer.active.collect(&:id) : [nil] + Designer.where(:slug => params[:designers].split(" ")).collect(&:id)
    primary_tags = params[:primary_tags].try(:split, "+")
    secondary_tags = params[:secondary_tags].try(:split, "+")
    featured_tag_item = ActsAsTaggableOn::Tag.where(:name => primary_tags.first).first unless primary_tags.blank?
    @tag_detail = TagDetail.where(:tag_id => featured_tag_item.id).first unless featured_tag_item.blank?
    if !primary_tags.blank? && !secondary_tags.blank?
      @projects = Project.where({:ooak => true, :status => Project::ACTIVE, :designer_id => designers}).tagged_with(primary_tags, :any => true)
        .tagged_with(secondary_tags, :any => true).order("RANDOM()").paginate(:page => params[:page], :per_page => 24)
      @category_tags = primary_tags
      @filter_tags = secondary_tags
    elsif !primary_tags.blank? && secondary_tags.blank?
      @projects = Project.where({:ooak => true, :status => Project::ACTIVE, :designer_id => designers}).tagged_with(primary_tags, :any => true)
        .order("RANDOM()").paginate(:page => params[:page], :per_page => 24)
      @category_tags = primary_tags
      @filter_tags = primary_tags
    else
      @projects = Project.where({:ooak => true, :status => Project::ACTIVE, :designer_id => designers}).order("RANDOM()")
        .paginate(:page => params[:page], :per_page => 24)
      @category_tags = []
      @filter_tags = []
    end
    render :list, :layout => 'inbound_layout'
  end

  def preorders
    Project.connection.execute("select setseed(0.2)")
    taxonomies = params[:taxonomies].blank? ?  [nil] + Project::TAXONOMIES.values : params[:taxonomies]
    designers = params[:designers].blank? ?  [nil] + Designer.active.collect(&:id) : params[:designers]
    @projects = Project.where({:ooak => false, :status => Project::ACTIVE, :taxonomy => taxonomies, :designer_id => designers})
      .order("RANDOM()").paginate(:page => params[:page], :per_page => 18)
    render :list, :layout => 'inbound_layout'
  end

  def home
    @ooak_projects = Project.where({:status => Project::ACTIVE, :ooak => true}).sample(12)
    @designers = Designer.where({:status => Designer::ACTIVE}).sample(12)
    @showcase_designers = Designer.where({:status => Designer::ACTIVE}).order("RANDOM()").sample(7)
    @blog_posts = BlogPost.last(8).reverse
    @tumblr_posts = TumblrPost.last(12).reverse
    render :layout => 'inbound_layout'
  end

  def search
    params["q"] ||= ''
    @projects = Project.search(params["q"], {:hitsPerPage => 20, :page => params[:page]})
  end

  def collection
    @projects = Project.tagged_with(params[:collection].gsub("+", " ")).paginate(:page => params[:page], :per_page => 20)
  end

  def show
    @project = Project.find(params[:id])
    @readonly = true if current_user.blank?
    render :layout => 'inbound_layout'
  end

  def edit
    @project = Project.find(params[:id])
    render_404 and return if !@project.can_edit?(current_user)
    render :layout => 'inbound_layout'
  end

  def redirect_to_index
    render_404 and return if current_user.designer.blank?
    redirect_to designer_projects_url(current_user.designer)
  end

  def ask_a_question
    if current_user and !params[:product_id].blank?
      project = Project.where(:id => params[:product_id].to_i).first
      designer_user = project.designer.user
      if project and designer_user
        message = Message.create(:user_id => current_user.id, :project_id => project.id, :recipient_id => designer_user.id, :message => params[:question].to_s)
        MessagesMailer.create(message).deliver
        MessagesMailer.notify(message).deliver
        render :json => {:success => true} and return
      end
    end
    render :json => {:success => false} and return
  end

  def favorite
    render_404 and return if params[:project_id].blank?
    favorite = Favorite.where(:user_id => current_user.id, :project_id => params[:project_id].to_i).first_or_create
    if favorite
      render :json => {:success => true } and return
    else
      render :json => {:success => false } and return
    end
  end

  def unfavorite
    render_404 and return if params[:project_id].blank?
    favorite = Favorite.where(:user_id => current_user.id, :project_id => params[:project_id].to_i).first
    if favorite.try(:destroy)
      render :json => {:success => true } and return
    else
      render :json => {:success => false } and return
    end
  end

  def update_status
    status = params["status"].to_i
    from_paypal = !params["paypal"].blank?
    @success = false
    order = current_user.shopping_carts.active.last.try(:order)
    if status == 0 && !from_paypal
      user = current_user
      transaction_id = params["orderID"]
      amount = params["amount"]
      api_key = ZWITCH[Rails.env]['api_key']
      api_secret = ZWITCH[Rails.env]['api_secret']
      checksum = OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('md5'), api_secret, "#{transaction_id}|#{amount}|#{api_key}|#{status}")
      if checksum == params["checksum"]
        @success = true
      end
    elsif from_paypal
      secret = PAYPAL[Rails.env]['secret']
      if order
        checksum = OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('md5'), secret, order.transaction_id.to_s)
        if checksum == params["checksum"]
          @success = true
        end
      end
    end

    if @success
      if order
        order.confirmed = true
        order.confirm_code = "#{order.shopping_cart.id}##{order.id}"
        order.payment_mode = from_paypal ? "PayPal" : params["paymentMode"]
        order.save
        order.coupon.try(:used!)
        order.shopping_cart.status = false
        order.shopping_cart.save
        order.shopping_cart.shopping_cart_items.each do |item|
          inventory_detail = item.project.inventories.where(:size => item.details[:size]).first
          if inventory_detail
            inventory_detail["sold"] = inventory_detail["sold"] + item.quantity
            inventory_detail.save
          end
        end
        OrderMailer.confirm_email(order).deliver
        OrderMailer.success(order).deliver
        @order = order
      end
    else
      flash[:error] = "Oops! Something went wrong. We couldn't find the order you were paying for. Contact support"
      redirect_to :root and return
    end
    render :layout => 'inbound_layout'
  end

  def junglee
    @projects = Project.where({:status => Project::ACTIVE}).order("created_at DESC")
    render :layout => false
  end

  private
  
  def show_pending_notification
    return nil unless current_user
    @pending_order = current_user.shopping_carts.active.last.try(:order)
  end

end
