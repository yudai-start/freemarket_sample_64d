require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  # 本番環境でのみ、fogを適用
  if Rails.env.production?
  config.storage = :fog
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: Rails.application.credentials.aws[:access_key_id]
    aws_secret_access_key: Rails.application.credentials.aws[:secret_access_key]
    region: 'ap-northeast-1'
  }

  config.fog_directory  = 'freemarket.sample64d'
  config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/freemarket.sample64d'

  # 本番環境以外では、アップロード先をローカルにする
  else
    config.storage :file
end