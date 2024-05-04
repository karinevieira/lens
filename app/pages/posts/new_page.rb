# frozen_string_literal: true

module Posts
  class NewPage < ApplicationPage
    def initialize(current_user:, post:)
      @current_user = current_user
      @post = post
    end

    private

    attr_reader :current_user, :post
  end
end
