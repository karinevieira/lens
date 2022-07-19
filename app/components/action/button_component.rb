# frozen_string_literal: true

module Action
  class ButtonComponent < ViewComponent::Base
    attr_reader :tag, :href, :html_options

    def initialize(tag: :button, href: nil, **html_options)
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
      "text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300
      font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center dark:bg-blue-600
      dark:hover:bg-blue-700 dark:focus:ring-blue-800".squish
    end
  end
end
