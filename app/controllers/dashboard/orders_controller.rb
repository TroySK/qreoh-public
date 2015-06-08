class Dashboard::OrdersController < ApplicationController
  
  before_filter :authenticate_user!, :admin_only
  layout 'admin_layout'

  def index
    @orders = Order.order("updated_at DESC").paginate(:page => params[:page], :per_page => 5)
    render :list
  end

  def pending
    @orders = Order.where({:confirmed => false}).order("updated_at DESC").paginate(:page => params[:page], :per_page => 5)
    render :list
  end

  def confirmed
    @orders = Order.where({:confirmed => true}).order("updated_at DESC").paginate(:page => params[:page], :per_page => 5)
    render :list
  end

  def show
    @order = Order.find(params[:id])
    render :layout => false
  end

  def ship
    @order = Order.find(params[:id])
  end

  def delivery
    @order = Order.find(params[:id])
    OrderMailer.confirm_delivery(@order).deliver
    flash[:notice] = 'Sent!'
    redirect_to :back
  end

  def pending_push
    @order = Order.find(params[:id])
    OrderMailer.pending_push(@order).deliver
    flash[:notice] = 'Sent!'
    redirect_to :back
  end

  def delayed
    @order = Order.find(params[:id])
    OrderMailer.delayed(@order).deliver
    flash[:notice] = 'Sent!'
    redirect_to :back
  end

  def notify_shipping
    order = Order.find(params[:id])
    courier = params[:courier]
    tracking_url = params[:tracking_url]
    tracking_code = params[:tracking_code]
    render_404 and return if courier.blank? or tracking_url.blank? or tracking_code.blank?
    OrderMailer.notify_shipping(order, courier, tracking_url, tracking_code).deliver
    flash[:notice] = 'Sent!'
    redirect_to :back
  end

end
