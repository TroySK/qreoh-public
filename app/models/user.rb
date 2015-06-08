class User < ActiveRecord::Base
  acts_as_paranoid
  acts_as_follower
  letsrate_rater
  # Include default devise modules. Others available are:
  # :token_authenticatable, :lockable, :timeoutable ,
  devise :database_authenticatable, :omniauthable, :registerable, :oauth2_providable, :oauth2_password_grantable, :oauth2_refresh_token_grantable, :oauth2_authorization_code_grantable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauth_providers => [:facebook, :twitter, :google_oauth2, :linkedin, :behance, :yahoo]

  attr_accessible :email, :password, :password_confirmation, :remember_me, :current_password
  after_create :send_welcome_mail
  
  has_one :designer
  has_many :authorizations, :dependent => :destroy
  has_many :designer_feedbacks
  has_many :favorites
  has_many :shopping_carts
  has_many :orders
  has_many :referrals
  
  def is_a_designer?
  	self.designer
  end

  def is_admin?
    (self.id<=2)
  end

  def name
    return self.email.gsub(/@.*/, '')
  end

  def mailboxer_email(object)
    return self.email
  end

  def current_shopping_cart_items_count
    shopping_carts.active.last.try(:shopping_cart_items).try(:count)
  end

  def send_welcome_mail
    self.referrals.create(:referrer_type => Referral::JOINING_250_OFF)
    UserMailer.create(self).deliver
  end
  
end
