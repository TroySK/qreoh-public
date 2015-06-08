class ColorDetail < ActiveRecord::Base
  belongs_to :project
  attr_accessible :color, :title, :quantity
end
