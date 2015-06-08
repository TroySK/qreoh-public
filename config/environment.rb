# Load the rails application
require File.expand_path('../application', __FILE__)

ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => ENV['SENDGRID_USERNAME'],
  :password       => ENV['SENDGRID_PASSWORD'],
  :domain         => 'heroku.com',
  :enable_starttls_auto => true
}

qreoh_date_formats = { :default => '%d-%m-%Y' } 
Time::DATE_FORMATS.merge!(qreoh_date_formats) 
Date::DATE_FORMATS.merge!(qreoh_date_formats)

# Initialize the rails application
Qreoh::Application.initialize!
