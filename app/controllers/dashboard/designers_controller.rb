class Dashboard::DesignersController < ApplicationController

  before_filter :authenticate_user!, :admin_only
  layout 'admin_layout'

  def index
    @designers = Designer.all.order("updated_at DESC")
    render :list
  end

  def pending
    @designers = Designer.where({:status => 0}).order("updated_at DESC")
    render :list
  end

  def active
    @designers = Designer.where({:status => 1}).order("updated_at DESC")
    render :list
  end

  def hidden
    @designers = Designer.where({:status => 2}).order("updated_at DESC")
    render :list
  end

  def show
    @designer = Designer.find(params[:id])
  end

  def current_collection
    @designers = Designer.where({:status => 1}).order("updated_at DESC")
  end

  def notify_approval
    designer = Designer.find(params[:id])
    DesignerMailer.notify_approval(designer).deliver
    flash[:info] = 'eMail sent successfully'
    redirect_to dashboard_designers_url
  end

  def notify_rejection
    designer = Designer.find(params[:id])
    DesignerMailer.notify_rejection(designer).deliver
    flash[:info] = "eMail sent successfully. Don't be sad."
    redirect_to dashboard_designers_url
  end
end
