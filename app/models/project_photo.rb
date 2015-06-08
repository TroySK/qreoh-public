class ProjectPhoto < ActiveRecord::Base
  attr_accessible :image, :project_id, :designer_id
  mount_uploader :image, ProjectPhotoUploader
  belongs_to :project
  belongs_to :designer
end
