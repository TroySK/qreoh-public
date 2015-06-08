class Users::RegistrationsController < Devise::RegistrationsController

  def create
    super
    unless cookies[:referral_code].blank?
      referral = Referral.find_by_referral_code(cookies[:referral_code])
      referrer = referral.user
      if !referral.blank? && !current_user.blank? && !referrer.blank?
        referrer_coupon = Coupon.new_250_off
        UserMailer.referrer_coupon(referrer, current_user, referrer_coupon, referral.referral_code).deliver
        referred_coupon = Coupon.new_250_off
        new_user_referral = current_user.referrals.where(:referrer_type => Referral::JOINING_250_OFF).first
        UserMailer.referred_coupon(current_user, referrer, referred_coupon, new_user_referral.referral_code).deliver
        referral.increment(:referral_count)
        cookies.delete(:referral_code)
      end
    end
  end

end