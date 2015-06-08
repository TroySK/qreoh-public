# config/initializers/geocoder.rb
Geocoder.configure(
  :timeout => 15,
  :cache => Rails.cache
)