# frozen_string_literal: true

module Action
  class LinkComponent < ViewComponent::Base
    attr_reader :href, :color, :html_options

    COLOR_CLASS = {
      blue: "text-blue-600",
      green: "text-green-600",
      red: "text-red-600"
    }.freeze

    def initialize(href:, color: :blue, **html_options)
      @href = href
      @color = color
      @html_options = html_options
    end

    private

    def all_classes
      ["text-sm font-normal", COLOR_CLASS[color]]
    end
  end
end
