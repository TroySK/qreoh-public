class ProjectUpdate < ActiveRecord::Base
  attr_accessible :project_id, :update_text
  belongs_to :project
end
