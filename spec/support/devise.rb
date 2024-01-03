# frozen_string_literal: true

module Devise
  module CustomSignInHelpers
    # This method requires `factory_bot` gem installed and a `:user` factory registered
    # It creates a new user if no parameter is given, and returns the signed in user
    def sign_in(user = create(:user))
      super(user)
      user
    end
  end
end

RSpec.configure do |config|
  %i[request system].each do |type|
    config.include Devise::Test::IntegrationHelpers, type: type
    config.include Devise::CustomSignInHelpers, type: type
  end
end
