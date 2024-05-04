# frozen_string_literal: true

module Users
  class ShowPage < ApplicationPage
    def initialize(current_user:, user:)
      @current_user = current_user
      @user = user
    end

    private

    attr_reader :current_user, :user
  end
end
