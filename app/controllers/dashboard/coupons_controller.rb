class Dashboard::CouponsController < ApplicationController

  before_filter :authenticate_user!, :admin_only
  layout 'admin_layout'

  def index
    @coupons = Coupon.order('created_at DESC').paginate(:page => params[:page], :per_page => 10)
    render :list
  end

  def used
    @coupons = Coupon.where(:used => true).order('created_at DESC').paginate(:page => params[:page], :per_page => 10)
    render :list
  end

  def active
    @coupons = Coupon.where(:used => false).order('created_at DESC').paginate(:page => params[:page], :per_page => 10)
    render :list
  end

  def create
    coupon = Coupon.create(params[:coupon])
    redirect_to dashboard_coupons_url
  end

  def destroy
    coupon = Coupon.find(params[:id])
    coupon.destroy
    redirect_to dashboard_coupons_url
  end
end
