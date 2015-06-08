class Authorization < ActiveRecord::Base
  attr_accessible :provider, :secret, :token, :uid, :user_id
  belongs_to :user
end
