class InventoriesController < ApplicationController
  
  before_filter :authenticate_user!

  def update
    @project = Project.find(params[:project_id])
    render_404 and return if !@project.can_edit?(current_user)
    @inventory = @project.inventories.find(params[:id])
    respond_to do |format|
      if @inventory.update_attributes(params[:inventory])
        format.json { respond_with_bip(@inventory) }
      else
        format.json { respond_with_bip(@inventory) }
      end
    end
  end

end
