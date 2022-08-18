# frozen_string_literal: true

require "active_storage_validations/matchers"

RSpec.configure do |config|
  config.include ActiveStorageValidations::Matchers
end
