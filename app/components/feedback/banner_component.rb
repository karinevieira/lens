# frozen_string_literal: true

module Feedback
  class BannerComponent < ViewComponent::Base
    attr_reader :type

    WRAPPER_TYPE_CLASSES = {
      alert: "text-red-800 border-red-300 bg-red-50",
      notice: "text-green-800 border-green-300 bg-green-50"
    }.freeze

    BUTTON_TYPE_CLASSES = {
      alert: "bg-red-50 text-red-500 focus:ring-red-400 hover:bg-red-200",
      notice: "bg-green-50 text-green-500 focus:ring-green-400 hover:bg-green-200"
    }.freeze

    def initialize(type:)
      @type = type
    end

    private

    def banner_id
      @banner_id ||= "banner-#{SecureRandom.alphanumeric(6)}"
    end

    def notice?
      type == :notice
    end

    def wraper_base_classes
      "flex p-4 mb-4 rounded-lg border"
    end

    def wrapper_classes
      [wraper_base_classes, WRAPPER_TYPE_CLASSES[type]]
    end

    def button_base_classes
      "ml-auto -mx-1.5 -my-1.5 rounded-lg focus:ring-2 p-1.5 inline-flex h-8 w-8"
    end

    def button_classes
      [button_base_classes, BUTTON_TYPE_CLASSES[type]]
    end
  end
end
