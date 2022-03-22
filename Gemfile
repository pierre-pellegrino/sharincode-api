source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.4'

gem 'aws-sdk-s3', '~> 1.113'
gem 'bootsnap', require: false
gem 'database_cleaner'
gem 'devise', '~> 4.8'
gem 'devise-jwt', '~> 0.9.0'
gem 'factory_bot_rails'
gem 'faker'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rack-cors'
gem 'rails', '~> 7.0.2', '>= 7.0.2.3'
gem 'rubocop'
gem 'tzinfo-data', platforms: %i[ mingw mswin x64_mingw jruby ]

group :development, :test do
  gem 'debug', platforms: %i[ mri mingw x64_mingw ]
  gem 'rspec-rails'
end

group :development do
  gem 'letter_opener'
end
