class AccountsController < ApplicationController

  before_filter :authenticate_user!

  def profile
    render :layout => 'inbound_layout'
  end
  
  def settings

  end

end
