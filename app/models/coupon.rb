class Coupon < ActiveRecord::Base
  belongs_to :order
  attr_accessible :code, :coupon_type, :used, :value

  PERCENTAGE = 0
  FIXED = 1
  PERCENTAGE_MULTIPLY = 2
  FIXED_MULTIPLY = 3

  def used!
    self.update_attributes({:used => true})
  end

  def self.on_the_fly(code)
    parent_coupon = Coupon.where({:code => code, :used => false, :coupon_type => [PERCENTAGE_MULTIPLY, FIXED_MULTIPLY]}).first
    return nil unless parent_coupon
    coupon = Coupon.create({:code => SecureRandom.uuid, :coupon_type => (parent_coupon.coupon_type - 2), :value => parent_coupon.value})
  end

  def label
    case coupon_type
    when 0
      return 'Percentage'
    when 1
      return 'Fixed'
    when 2
      return 'Percentage Multiply'
    when 3
      return 'Fixed Multiply'
    end
  end

  def self.new_250_off
    Coupon.create({:code => SecureRandom.uuid, :coupon_type => 1, :value => 250})
  end
end
