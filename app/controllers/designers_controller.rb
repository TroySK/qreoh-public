class DesignersController < ApplicationController

  before_filter :authenticate_user!, :except => [:show, :view, :index ]
  layout 'inbound_layout'

  def index
    @designers = Designer.where({:status => Designer::ACTIVE}).order('name ASC').paginate(:page => params[:page], :per_page => 12)
  end

  def show
    @designer = Designer.find(params[:id])
    render_404 and return if @designer.blank?
  end

  def new
    @designer = Designer.where(:user_id => current_user.id).first
    @designer ||= Designer.new(:user_id => current_user.id)
    render :edit
  end

  def edit
    @designer = Designer.find(params[:id])
    render_404 and return if @designer.blank? or !@designer.is_owner?(current_user)
  end

  def create
    @designer = Designer.new(params[:designer])
    if @designer.save
      DesignerMailer.notify(@designer).deliver
      DesignerMailer.create(@designer).deliver
      flash[:info] = "Congrats! Your designer profile has been created. Start uploading your products now!"
    else
      flash[:error] = 'Oops! This is embarasssing but something went wrong! Please go back and try again. Sorry for the inconvenience.'
      render :new and return
    end
    render :show and return
  end


  def update
    @designer = Designer.find(params[:id])
    render_404 and return if !@designer.is_owner?(current_user)
    respond_to do |format|
      if @designer.update_attributes(params[:designer])
        format.html { redirect_to([@designer], :notice => 'Designer was successfully updated.') }
        format.json { respond_with_bip(@designer) }
      else
        format.html { render :action => "edit" }
        format.json { respond_with_bip(@designer) }
      end
    end
  end

  def add_feedback
    if current_user and !params[:designer_id].blank? and !params[:feedback_text].to_s.blank?
      designer = Designer.where(:id => params[:designer_id].to_i).first
      if designer
        DesignerFeedback.create(:designer_id => designer.id, :user_id => current_user.id, :feedback_text => params[:feedback_text].to_s)
        render :json => {:success => true} and return
      end
    end
    render :json => {:success => false} and return
  end

  def contact
    if current_user and !params[:designer_id].blank?
      designer = Designer.where(:id => params[:designer_id].to_i).first
      designer_user = designer.user
      if designer_user
        message = Message.create(:user_id => current_user.id, :project_id => 0, :recipient_id => designer_user.id, :message => params[:question].to_s)
        MessagesMailer.notify(message).deliver
        MessagesMailer.create(message).deliver
        render :json => {:success => true} and return
      end
    end
    render :json => {:success => false} and return
  end

  def follow
    designer = Designer.find(params[:id])
    current_user.toggle_follow!(designer)
    respond_to do |format|
      format.html { redirect_to( :back, :notice => current_user.follows?(designer) ? 'Followed!' : 'Unfollowed!') }
      format.json { {"status" => true, "following" => current_user.follows?(designer)} }
    end
  end

  def manage
    @designer = Designer.find(params[:id])
    render_404 and return if @designer.blank? or !@designer.is_owner?(current_user)
  end
end
