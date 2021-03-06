CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',       # required
    :aws_access_key_id      => ENV['AMAZON_KEY'],       # required
    :aws_secret_access_key  => ENV['AMAZON_SECRET'],       # required
  }
  config.fog_directory  = 'instafood'                     # required
  config.fog_public     = false                                   # optional, defaults to true
end
