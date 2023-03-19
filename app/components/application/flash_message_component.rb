# frozen_string_literal: true

module Application
  class FlashMessageComponent < ViewComponent::Base
    attr_reader :flash

    def initialize(flash:)
      @flash = flash
    end

    private

    def render?
      flash.present?
    end

    def flash_message
      type, message = flash.first

      render(Feedback::BannerComponent.new(type: type)) { message }
    end
  end
end
