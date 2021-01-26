source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.1'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
gem "redis", ">= 4.0", :require => ["redis", "redis/connection/hiredis"]
gem "hiredis"

# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Trying out new view components
gem "view_component", "~> 2.11"

# Our holy saviour
gem "pry-rails", "~> 0.3.9"

# Used for searching for text on specific fields
gem "pg_search", "~> 2.3"

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

# Drives all the reactive elements on the front end
gem "stimulus_reflex", "~> 3.2"

#data validation
gem "dry-schema", "~> 1.5"

group :development, :test do
  # Fixture generator
  gem "factory_bot_rails"

  # Handle .env files
  gem 'dotenv-rails'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem "rubocop", "~> 1.7.0"
  gem "standard", "~> 0.11"

  gem "bundler-audit"

  gem 'bullet'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  #gem 'capybara', '>= 2.15'
  #gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  #gem 'webdrivers'

  # Testing Framework
  gem "rspec-rails", "~> 4.0"
end

gem "dry-monads", "~> 1.3"

gem "dry-types", "~> 1.4"

gem "dry-validation", "~> 1.5"
