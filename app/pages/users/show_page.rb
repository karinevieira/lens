# frozen_string_literal: true

module Users
  class ShowPage < ApplicationPage
    attr_reader :user

    def initialize(user:)
      @user = user
    end
  end
end
