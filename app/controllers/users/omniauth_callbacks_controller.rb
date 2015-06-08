class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    
  def facebook
    oauthorize "Facebook"
  end

  def google_oauth2
    oauthorize "Google_oauth2"
  end
  
  # def twitter
  #   oauthorize "Twitter"
  # end
  
  # def linkedin
  #   oauthorize "LinkedIn"
  # end

  # def behance
  #   oauthorize "Behance"
  # end

  # def yahoo
  #   oauthorize "Yahoo"
  # end
  
  def passthru
    render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
  end
  
private

  def oauthorize(kind)
    @user = find_for_ouath(kind, env["omniauth.auth"], current_user)
    if @user
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => kind
      session["devise.#{kind.downcase}_data"] = env["omniauth.auth"]
      sign_in_and_redirect @user, :event => :authentication
    end    
  end

  def find_for_ouath(provider, access_token, resource=nil)
    user, email, name, uid, auth_attr = nil, nil, nil, {}
    case provider
    when "Facebook"
      uid = access_token['uid']
      email = access_token['info']['email']
      auth_attr = { :uid => uid, :token => access_token['credentials']['token'], :secret => nil }
    when "Google_oauth2"
      uid = access_token['uid']
      email = access_token['info']['email']
      auth_attr = { :uid => uid, :token => access_token['credentials']['token'], :secret => nil }
    # when "Twitter"
    #   uid = access_token['extra']['user_hash']['id']
    #   name = access_token['user_info']['name']
    #   auth_attr = { :uid => uid, :token => access_token['credentials']['token'], :secret => access_token['credentials']['secret'], :name => name, :link => "http://twitter.com/#{name}" }
    # when "LinkedIn"
    #   uid = access_token['uid']
    #   email = access_token['info']['email']
    #   auth_attr = { :uid => uid, :token => access_token['credentials']['token'], :secret => access_token['credentials']['secret'] }
    # when "Behance"
    #   uid = access_token['uid']
    #   email = access_token['info']['email']
    #   auth_attr = { :uid => uid, :token => access_token['credentials']['token'], :secret => access_token['credentials']['secret'] }
    # when "Yahoo"
    #   uid = access_token['uid']
    #   email = access_token['info']['email']
    #   auth_attr = { :uid => uid, :token => access_token['credentials']['token'], :secret => access_token['credentials']['secret'] }
    else
      raise 'Provider #{provider} not handled'
    end
    if resource.nil?
      if email
        user = find_for_oauth_by_email(email, resource)
      elsif uid
        user = find_for_oauth_by_uid(uid, resource)
      end
    else
      user = resource
    end
    
    auth = user.authorizations.find_by_provider(provider)
    if auth.nil?
      auth = user.authorizations.build(:provider => provider)
      user.authorizations << auth
    end
    auth.update_attributes auth_attr
    
    return user
  end

  def find_for_oauth_by_uid(uid, resource=nil)
    user = nil
    if auth = Authorization.find_by_uid(uid.to_s)
      user = auth.user
    end
    return user
  end

  def find_for_oauth_by_email(email, resource=nil)
    if user = User.find_by_email(email.downcase)
      user
    else
      user = User.new(:email => email, :password => Devise.friendly_token[0,20])
      #user.skip_confirmation!
      user.save
    end
    return user
  end

end