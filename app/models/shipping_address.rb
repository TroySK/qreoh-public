class ShippingAddress < ActiveRecord::Base
  attr_accessible :address1, :address2, :city, :country, :name, :phone_number, :order_id, :state, :zipcode

  validates_presence_of :name, :address1, :zipcode, :phone_number, :order_id
  belongs_to :orders

  def domestic?
    country == "IN"
  end
end
