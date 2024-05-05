# frozen_string_literal: true

module Users
  class ShowPage < ApplicationPage
    def initialize(user:, current_user: nil)
      @user = user
      @current_user = current_user
    end

    private

    attr_reader :user, :current_user

    def allowed_to_edit?
      current_user.present? && allowed_to?(:edit?, user.profile, context: { user: current_user }, with: ProfilePolicy)
    end
  end
end
