class Message < ActiveRecord::Base
  attr_accessible :message, :recipient_id, :user_id, :project_id, :archived

  belongs_to :user
  belongs_to :recipient, :class_name => "User", :foreign_key => :recipient_id
  belongs_to :project
end
