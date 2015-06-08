class Dashboard::ProjectsController < ApplicationController

  before_filter :authenticate_user!, :admin_only
  layout 'admin_layout'

  def index
    @projects = Project.order("updated_at DESC").paginate(:page => params[:page], :per_page => 20)
    render :list
  end

  def pending
    @projects = Project.where({:status => 0}).order("updated_at DESC").paginate(:page => params[:page], :per_page => 20)
    render :list
  end

  def active
    @projects = Project.where({:status => 1}).order("updated_at DESC").paginate(:page => params[:page], :per_page => 20)
    render :list
  end

  def hidden
    @projects = Project.where({:status => 2}).order("updated_at DESC").paginate(:page => params[:page], :per_page => 20)
    render :list
  end

  def archived
    @projects = Project.where({:status => 3}).order("updated_at DESC").paginate(:page => params[:page], :per_page => 20)
    render :list
  end

  def show
    @project = Project.find(params[:id])
  end

  def report
    @projects = Project.where({:status => 1}).order("created_at DESC")
  end
end
