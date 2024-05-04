# frozen_string_literal: true

module Profiles
  class EditPage < ApplicationPage
    def initialize(user:)
      @user = user
    end

    private

    attr_reader :user
  end
end
