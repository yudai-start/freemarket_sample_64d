Recaptcha.configure do |config|
  # site_key = Rails.application.credentials[:recaptcha][:site_key]
  # secret_key = Rails.application.credentials[:recaptcha][:secret_key]
  # config.site_key = ENV['RECAPTCHA_PUBLIC_KEY']
  # config.secret_key = ENV['RECAPTCHA_PRIVATE_KEY']
  # ENV['RECAPTCHA_SITE_KEY']   = Rails.application.credentials.recaptcha[:site_key]
  # ENV['RECAPTCHA_SECRET_KEY'] = Rails.application.credentials.recaptcha[:secret_key]

  config.site_key = Rails.application.credentials.recaptcha[:site_key]
  config.secret_key = Rails.application.credentials.recaptcha[:secret_key]  
end
