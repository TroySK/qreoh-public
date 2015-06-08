class OrdersController < ApplicationController

  before_filter :authenticate_user!, :except => [:checkout]
  layout 'inbound_layout'
  include ApplicationHelper


  def index
    @orders = current_user.orders.order('updated_at DESC').paginate(:page => params[:page], :per_page => 5)
  end

  def buy
    project = Project.find(params[:project_id]) if params[:project_id]
    size = params[:size].to_s
    @shopping_cart = current_user.shopping_carts.active.last
    if @shopping_cart.blank?
      if project.blank?
        flash[:info] = 'Nothing in your cart. Shop! Shop! Shop!'
        redirect_to :root and return
      else
        @shopping_cart = ShoppingCart.create(:user_id => current_user.id)
      end
    end
    @shopping_cart.add(project, project.price, {:size => size}) if project
  end

  def remove
    project = Project.find(params[:project_id])
    shopping_cart = current_user.shopping_carts.active.last
    flash[:error] = "No item to remove" if project.blank? or shopping_cart.blank?
    flash[:info] = "#{project.title} removed from cart" if shopping_cart.remove(project)
    if shopping_cart.empty?
      shopping_cart.try(:order).try(:destroy)
      shopping_cart.destroy
    end
    redirect_to :checkout
  end

  def checkout
    project = Project.find(params[:project_id]) if params[:project_id]
    size = params[:size].to_s
    if current_user
      @shopping_cart = current_user.shopping_carts.active.last
      if @shopping_cart.blank?
        if project.blank?
          flash[:info] = 'Nothing in your cart. Shop! Shop! Shop!'
          redirect_to :root and return
        else
          @shopping_cart = ShoppingCart.create(:user_id => current_user.id)
        end
      end
      if @shopping_cart
        @shopping_cart.add(project, project.price, {:size => size}) if project
        @order = @shopping_cart.order || Order.create(:user_id => current_user.id)
        @order.amount = @shopping_cart.total - @order.discount
        @order.save
        @order.reload
        @shopping_cart.order_id = @order.id
        @shopping_cart.save
        Messenger.order_notification(@order)
        OrderMailer.notify(@order).deliver
        @shipping_address = current_user.orders.confirmed.last.try(:shipping_address) || @shopping_cart.try(:order).try(:shipping_address) || ShippingAddress.new(:order_id => @order.id)
        if !@order
          flash[:error] = 'Oops! Something went wrong.'
          redirect_to :root and return
        end
      else
        flash[:info] = 'Nothing in your cart. Shop! Shop! Shop!'
        redirect_to :root and return
      end
    else
      cart_details = {:project_id => project.id, :size => size} if project
      cookies[:cart] = {:value => JSON.generate(cart_details), :expires => 1.hour.from_now} if cart_details
      redirect_to new_user_session_url
    end
  end

  def cancel
    order = current_user.orders.active.last
    render_404 and return unless order
    if !order.confirmed
      order.shopping_cart.clear
      order.shopping_cart.destroy
      order.destroy
    end
    flash[:info] = "Your order has been cancelled."
    redirect_to :root and return
  end

  def apply_coupon
    render_404 and return if params[:coupon_code].blank?
    shopping_cart = current_user.shopping_carts.active.last
    order = shopping_cart.order
    # First check for Coupon Multiply
    dynamic_coupon = Coupon.on_the_fly(params[:coupon_code])
    coupon_code = dynamic_coupon.blank? ? params[:coupon_code] : dynamic_coupon.code
    coupon = Coupon.where({:code => coupon_code, :used => false}).first
    render_404 if order.blank?
    if !order.confirmed && order.coupon.blank? && coupon
      coupon.order_id = order.id
      coupon.used = false
      coupon.save
      order.amount = (shopping_cart.total - order.discount).round
      order.save
    end
    respond_to do |format|
      if coupon
        format.html do
          flash[:info] = "Your coupon has been applied successfully."
          redirect_to checkout_url and return
        end
        order.reload
        format.json { render json: { :success => true, :message => 'Your coupon has been applied successfully.', :amount => local_price_with_symbol(order.amount), :discount => local_price_with_symbol(order.discount) } }
      else
        format.html do
          flash[:error] = "Your coupon is invalid"
          redirect_to checkout_url and return
        end
        format.json { render json: { :success => false } }
      end
    end
  end

  def payment
    require 'securerandom'
    @order = current_user.shopping_carts.active.last.try(:order)
    if @order
      @shipping_address = ShippingAddress.where(:order_id => @order.id).first_or_create
      @shipping_address.update_attributes(params[:shipping_address])
      @order.transaction_id = SecureRandom.hex(10)
      @order.save
      if !@shipping_address
        flash[:error] = "Oops! Something went wrong. Please try again. Please fill all the mandatory fields."
      end
    else
      flash[:info] = 'Nothing to pay for. Shop! Shop! Shop!'
      redirect_to :root and return
    end
  end

  def cod
    @order = current_user.shopping_carts.active.last.try(:order)
    OrderMailer.cod_verify(@order).deliver
    unless @order
      flash[:info] = 'Nothing to pay for. Shop! Shop! Shop!'
      redirect_to :root and return
    end
  end

  def finalize
    @success = false
    @order = current_user.orders.last
    payment_mode = params["paypal"].blank? ? "Instamojo" : "PayPal"

    if payment_mode == "Instamojo"
      @success = @order.verify_instamojo_transaction_checksum(@order, params["payment_id"])
    else
      @success = @order.verify_paypal_transaction_checksum(params["checksum"])
    end

    if @success && !@order.confirmed?
      @order.complete(payment_mode)
    end
    render :layout => 'inbound_layout'
  end

  def customize
    shopping_cart_item = ShoppingCartItem.where(:id => params[:id]).first
    shopping_cart_item["details"][:message] = params[:message]
    shopping_cart_item.save
    render :json => {"success" => true}
  end

end
