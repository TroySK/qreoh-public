class ProductPhotosController < ApplicationController
  
  before_filter :find_or_build_photo
  before_filter :authenticate_user!
  
  def create
      unless @photo.save
        render inline: 'Failure to upload' and return
      end
      render inline: 'Success' and return
  end
 
  private
    
  def find_or_build_photo
    @designer = Designer.find_by_user_id(current_user.id)
    @photo = @designer.project_photos.build(:image => params[:file],:designer_id => @designer.id)
  end
 
end