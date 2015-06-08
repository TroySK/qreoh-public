class DiscourseSsoController < ApplicationController

  before_filter :authenticate_user!

  def sso
    secret = ""
    sso = SingleSignOn.parse(request.query_string, secret)
    sso.email = current_user.email
    sso.name = current_user.name
    sso.username = current_user.email
    sso.external_id = current_user.id
    sso.sso_secret = secret
    redirect_to sso.to_url(Rails.env.development? ? "http://localhost:4000/session/sso_login" : "http://discuss.qreoh.com/session/sso_login")
  end
end