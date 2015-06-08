class DesignerFeedback < ActiveRecord::Base
  attr_accessible :designer_id, :feedback_text, :user_id
  belongs_to :designer
  belongs_to :user
end
