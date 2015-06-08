class Dashboard::MessagesController < ApplicationController

  before_filter :authenticate_user!, :admin_only
  layout 'admin_layout'

  def index
    @messages = Message.where({:trashed => false, :archived => false}).paginate(:page => params[:page], :per_page => 10)
    render :list
  end

  def archived
    @messages = Message.where({:archived => true}).paginate(:page => params[:page], :per_page => 10)
    render :list
  end

  def trashed
    @messages = Message.where({:trashed => true}).paginate(:page => params[:page], :per_page => 10)
    render :list
  end
end
