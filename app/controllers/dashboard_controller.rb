class DashboardController < ApplicationController

  before_filter :authenticate_user!, :admin_only
  layout 'admin_layout'

end
