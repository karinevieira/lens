# frozen_string_literal: true

module Profiles
  class IndexPage < ApplicationPage
    def initialize(user:, profiles:)
      @user = user
      @profiles = profiles
    end

    private

    attr_reader :user, :profiles
  end
end
