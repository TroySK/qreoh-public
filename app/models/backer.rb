class Backer < ActiveRecord::Base
  attr_accessible :user_id
  has_many :orders
  belongs_to :user
end
