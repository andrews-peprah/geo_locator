source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

gem "rails", "~> 7.0.8"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "redis", "~> 4.0"
gem "bcrypt", "~> 3.1.7"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem "rack-cors"
gem "rack-attack"
gem "rack-timeout"
gem 'aasm'

# Grape
gem 'grape'
gem 'grape-active_model_serializers'
gem 'grape-jwt-authentication'
gem 'grape-swagger'
gem 'grape-swagger-rails'

# sidekiq - background jobs
gem 'sidekiq'
gem 'sidekiq-scheduler'

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'rspec', '~> 3.10.0'
  gem 'rspec-rails', '~> 5.1.0'
  gem 'solargraph'
end

group :test do
  gem 'simplecov', require: false
  gem 'timecop'
  gem 'vcr'
  gem 'webmock'
end
