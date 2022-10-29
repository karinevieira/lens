# frozen_string_literal: true

module Action
  class ButtonComponent < ViewComponent::Base
    attr_reader :color, :tag, :href, :html_options

    COLOR_CLASSES = {
      blue: "bg-blue-600 hover:bg-blue-800",
      green: "bg-green-600 hover:bg-green-800",
      red: "bg-red-600 hover:bg-red-800"
    }.freeze

    def initialize(color: :blue, tag: :button, href: nil, **html_options)
      @color = color
      @tag = tag
      @href = href
      @html_options = html_options
    end

    private

    def render?
      content.present?
    end

    def link_tag?
      tag == :a
    end

    def base_classes
      "focus:outline-none font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center text-white"
    end

    def all_classes
      [COLOR_CLASSES[color], base_classes]
    end
  end
end
