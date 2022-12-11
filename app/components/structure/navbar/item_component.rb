# frozen_string_literal: true

module Structure
  module Navbar
    class ItemComponent < ViewComponent::Base
      attr_reader :href, :title, :active, :html_options

      renders_one :icon

      def initialize(href:, title:, active: false, **html_options)
        @href = href
        @title = title
        @active = active
        @html_options = html_options
      end

      private

      def base_classes
        "inline-flex p-4 rounded-t-lg border-b-2 border-transparent group"
      end

      def active_classes
        active ? "text-blue-600 border-blue-600" : "hover:text-gray-600 hover:border-gray-300"
      end

      def all_classes
        [base_classes, active_classes]
      end
    end
  end
end
