class StaticController < ApplicationController

  before_filter :authenticate_user!, :only => [:create, :read ]
  layout 'inbound_layout'


  def read
    redirect_to ("/create/look") and return if current_user.designer.blank?
  end

  def go
    redirect_to ("/create/look") and return if current_user.designer.blank?
    redirect_to new_designer_project_url(current_user.designer) and return
  end

end