class TagDetail < ActiveRecord::Base
  attr_accessible :description, :tag_id
  has_attachment  :cover, accept: [:jpg, :jpeg, :png, :gif]

  def tag
    ActsAsTaggableOn::Tag.find(tag_id)
  end
  
end
