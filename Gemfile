# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.3"

# Authorization framework for Ruby/Rails applications [https://github.com/palkan/action_policy]
gem "action_policy", "0.6.8"
# Simple validations for Active Storage [https://github.com/igorkasyanchuk/active_storage_validations]
gem "active_storage_validations", "1.1.4"
# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", "1.18.3", require: false
# Bundle and process CSS [https://github.com/rails/cssbundling-rails]
gem "cssbundling-rails", "1.4.0"
# Flexible authentication solution for Rails with Warden [https://github.com/heartcombo/devise]
gem "devise", "4.9.3"
# High-level image processing wrapper for libvips and ImageMagick/GraphicsMagick [https://github.com/janko/image_processing]
gem "image_processing", "1.12.2"
# Bundle and transpile JavaScript [https://github.com/rails/jsbundling-rails]
gem "jsbundling-rails", "1.3.0"
# Lookbook provides UI for view component previews [https://github.com/allmarkedup/lookbook]
gem "lookbook", "2.2.1"
# Use postgresql as the database for Active Record
gem "pg", "1.5.4"
# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "6.4.2"
# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "7.1.3"
# Use Redis adapter to run Action Cable in production
gem "redis", "5.1.0"
# Composable service objects [https://github.com/sunny/actor]
gem "service_actor", "3.7.0"
# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails", "3.4.2"
# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails", "1.3.3"
# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails", "2.0.2"
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", "2.0.4", platforms: %i[mingw mswin x64_mingw jruby]
# A framework for building reusable, testable & encapsulated view components in Ruby on Rails [https://github.com/github/view_component]
gem "view_component", "2.53.0"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", "1.9.1", platforms: %i[mri mingw x64_mingw]
  # To help fixture creation [https://github.com/thoughtbot/factory_bot_rails]
  gem "factory_bot_rails", "6.4.3"
  # Provides RSpec-compatible one-liners to test common Rails functionality [https://github.com/thoughtbot/shoulda-matchers]
  gem "shoulda-matchers", "6.1.0"
end

group :development do
  # Linter to ERB or HTML files [https://github.com/Shopify/erb-lint]
  gem "erb_lint", "0.5.0", require: false
  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  gem "rack-mini-profiler", "3.3.0"
  # To ensure code consistency [https://docs.rubocop.org]
  gem "rubocop", "1.60.2"
  gem "rubocop-performance", "1.20.2"
  gem "rubocop-rails", "2.23.1"
  gem "rubocop-rspec", "2.26.1"
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console", "4.2.1"
end

group :test do
  # Acceptance test framework for web applications [https://github.com/teamcapybara/capybara]
  gem "capybara", "3.40.0"
  # Framework library to test our code [https://github.com/rspec/rspec-rails/]
  gem "rspec-rails", "6.1.1"
  # Limited DevTools interactions for Selenium WebDriver [https://rubygems.org/gems/selenium-devtools]
  gem "selenium-devtools", "0.121.0"
  # A browser automation framework and ecosystem [https://github.com/SeleniumHQ/selenium]
  gem "selenium-webdriver", "4.17.0"
end
