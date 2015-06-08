class ProjectUpdatesController < ApplicationController
  
  before_filter :authenticate_user!

  def create
    update = ProjectUpdate.new(params[:project_update])
    if update.save
      flash[:notice] = 'Update posted!'
    else
      flash[:error] = 'Unable to post update. Please try again.'
    end
    redirect_to designer_project_url(update.project.designer, update.project)
  end

end
