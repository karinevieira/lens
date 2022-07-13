# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", "1.12.0", require: false
# Bundle and process CSS [https://github.com/rails/cssbundling-rails]
gem "cssbundling-rails", "1.1.1"
# Bundle and transpile JavaScript [https://github.com/rails/jsbundling-rails]
gem "jsbundling-rails", "1.0.3"
# Use postgresql as the database for Active Record
gem "pg", "1.4.1"
# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "5.6.4"
# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "7.0.3.1"
# Use Redis adapter to run Action Cable in production
gem "redis", "4.7.1"
# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails", "3.4.2"
# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails", "1.0.4"
# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails", "1.1.1"
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", "2.0.4", platforms: %i[mingw mswin x64_mingw jruby]

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", "1.6.1", platforms: %i[mri mingw x64_mingw]
end

group :development do
  # To ensure code consistency [https://docs.rubocop.org]
  gem "rubocop", "1.31.2"
  gem "rubocop-performance", "1.14.2"
  gem "rubocop-rails", "2.15.2"
  gem "rubocop-rspec", "2.12.1"
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console", "4.2.0"
end
