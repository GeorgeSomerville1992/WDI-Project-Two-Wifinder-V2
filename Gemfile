source 'https://rubygems.org'

gem 'rails', '3.2.17'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg'
gem 'cancan'

# Gems used only for assets and not required
# in production environments by default.

group :assets do
  # gem 'sass-rails',   '~> 3.2.3'
  gem 'sass-rails', github: 'guilleiguaran/sass-rails', branch: 'backport'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'sprockets-rails', '=2.0.0.backport1'
  gem 'sprockets', '=2.2.2.backport2'

end

group :production do
  gem 'rails_12factor'
end

group :development, :test do
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
  gem 'hirb'
  gem 'letter_opener'
  gem 'factory_girl_rails'
  gem 'faker'
end

gem 'jquery-rails'
gem 'bootstrap-sass', '~> 3.1.1'
gem 'carrierwave', "0.9.0"
gem 'rmagick'
gem "ransack"
gem 'will_paginate', '~> 3.0'
gem 'haml-rails'
gem 'devise'
gem 'geocoder'
gem 'gmaps4rails'
gem 'gon'

group :test do
 gem 'rspec-rails', '~>2.14.2'
 gem 'database_cleaner'
 gem 'shoulda'
 gem 'capybara'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
