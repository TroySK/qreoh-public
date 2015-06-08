class UserMailer < ActionMailer::Base
  default from: 'Troy from QREOH <troy@qreoh.com>'
  layout 'inbound_mailer'

  def create(user)
    @user = user
    mail(to: user.email, subject: 'Welcome to the QREOH!')
  end

  def referrer_coupon(user, referred_user, coupon, referral_code)
    @user = user
    @referred_user = referred_user
    @coupon = coupon
    @referral_code = referral_code
    mail(to: user.email, subject: "A friend you had invited just joined QREOH! So, here's your coupon.")
  end

  def referred_coupon(user, referrer, coupon, referral_code)
    @user = user
    @referrer = referrer
    @coupon = coupon
    @referral_code = referral_code
    mail(to: user.email, subject: "You were invited! So, here's your coupon.")
  end

end
