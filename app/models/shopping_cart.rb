class ShoppingCart < ActiveRecord::Base
  acts_as_shopping_cart
  belongs_to :user
  belongs_to :order
  attr_accessible :user_id, :status

  scope :active, where(:status => true)

  def active?
    self.status
  end

  def tax_pct
    0
  end

  def sold!
    shopping_cart_items.each do |item|
      inventory_detail = item.project.inventories.where(:size => item.details[:size]).first
      if inventory_detail
        inventory_detail["sold"] = inventory_detail["sold"] + item.quantity
        inventory_detail.save
      end
    end
  end
end
