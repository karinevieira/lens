# frozen_string_literal: true

require "view_component/test_helpers"
require "capybara/rspec"

RSpec.configure do |config|
  %i[component page].each do |type|
    config.include ViewComponent::TestHelpers, type: type
    config.include Capybara::RSpecMatchers, type: type
  end
end
