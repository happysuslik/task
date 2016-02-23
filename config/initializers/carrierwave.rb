CarrierWave.configure do |config|
  config.fog_directory  = 'directory'                             # required
  config.fog_public     = false                                   # optional, defaults to true
end