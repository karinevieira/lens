# frozen_string_literal: true

module Form
  class LabelComponent < ViewComponent::Base
    attr_reader :html_options

    def initialize(**html_options)
      @html_options = html_options
    end

    private

    def render?
      content.present?
    end

    def all_classes
      "block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300"
    end

    def options
      html_options.merge(class: all_classes)
    end
  end
end
