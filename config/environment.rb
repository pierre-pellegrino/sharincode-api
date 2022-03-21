# Load the Rails application.
require_relative "application"

# Initialize the Rails application.

ActionMailer::Base.smtp_settings = {
  user_name: Rails.application.credentials.dig(:mailjet, :public_key),
  password: Rails.application.credentials.dig(:mailjet, :secret_key),
  domain: 'snipshare.dev@outlook.com',
  address: 'in-v3.mailjet.com',
  port: 587,
  authentication: :plain,
  enable_starttls_auto: true
}

Rails.application.initialize!
