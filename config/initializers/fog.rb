CarrierWave.configure do |config|
  config.fog_credentials = {
  }
  config.fog_directory  = 'qreoh'                     # required
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
  config.asset_host = "//d24pq6o7e98ahz.cloudfront.net"
end