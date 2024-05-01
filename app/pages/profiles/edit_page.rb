# frozen_string_literal: true

module Profiles
  class EditPage < ApplicationPage
    attr_reader :user

    def initialize(user:)
      @user = user
    end
  end
end
