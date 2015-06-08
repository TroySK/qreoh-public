class SizeDetail < ActiveRecord::Base
  belongs_to :project
  attr_accessible :size, :quantity
end
