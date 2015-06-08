class ApplicationController < ActionController::Base
  protect_from_forgery
  layout :layout_by_resource

  #after_filter :store_location
  before_filter :authenticate_user!, :only => 'admin_only'

  # def store_location
  #   # store last url as long as it isn't a /users path
  #   session[:previous_url] = request.fullpath unless request.fullpath =~ /\/users/
  # end

  # def after_sign_in_path_for(resource)
  #   session[:previous_url] || root_path
  # end

  rescue_from ActiveRecord::RecordNotFound do
    render_404
  end

  def render_404
    render 'static/404.html.erb', :layout => 'inbound_layout'
  end

  def admin_only
    render_404 and return if current_user and !current_user.is_admin?
  end

  def layout_by_resource
    "inbound_layout"
  end
end
