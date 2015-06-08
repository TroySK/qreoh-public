class Inventory < ActiveRecord::Base
  belongs_to :project
  attr_accessible :sold, :size, :total
end
