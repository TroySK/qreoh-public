class Referral < ActiveRecord::Base
  belongs_to :user
  attr_accessible :referral_count, :referrer_type

  SALT = "QREOH is Awwwsome!"
  JOINING_250_OFF = 0

  def referral_code
    hashids = Hashids.new(SALT)
    hash = hashids.encode(id)
  end

  def self.find_by_referral_code(referral_code)
    hashids = Hashids.new(SALT)
    referral_id = hashids.decode(referral_code)
    self.where(:id => referral_id).first
  end
end
