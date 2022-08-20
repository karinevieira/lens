# frozen_string_literal: true

module Action
  class ButtonComponent < ViewComponent::Base
    attr_reader :color, :tag, :href, :html_options

    COLOR_CLASSES = {
      blue: "text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300
      font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center dark:bg-blue-600
      dark:hover:bg-blue-700 dark:focus:ring-blue-800".squish,
      white: "text-gray-900 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 dark:bg-gray-800
      dark:text-white dark:border-gray-600 dark:hover:bg-gray-700 dark:hover:border-gray-600
      dark:focus:ring-gray-700".squish
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
      tag == :link
    end

    def all_classes
      COLOR_CLASSES[color]
    end
  end
end
