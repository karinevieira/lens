# frozen_string_literal: true

require "view_component/test_helpers"

RSpec.configure do |config|
  %i[component page].each do |type|
    config.include ViewComponent::TestHelpers, type: type
  end
end
