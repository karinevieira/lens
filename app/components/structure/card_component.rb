# frozen_string_literal: true

module Structure
  class CardComponent < ViewComponent::Base
    renders_one :image, "ImageComponent"
    renders_one :subtitle, "SubtitleComponent"
    renders_one :action, "ActionComponent"

    def all_classes
      "max-w-sm bg-white rounded-lg border border-gray-200 shadow-md dark:bg-gray-800 dark:border-gray-700"
    end

    class SubtitleComponent < ViewComponent::Base
      def call
        classes = "mb-3 text-base font-normal text-gray-700 dark:text-gray-400"
        content_tag :p, content, class: classes
      end
    end

    class ImageComponent < ViewComponent::Base
      def call
        image_tag(content)
      end
    end

    class ActionComponent < ViewComponent::Base
      attr_reader :href

      def initialize(href:)
        @href = href
      end

      def call
        link_to content, href, class: "text-sm font-normal text-blue-600 hover:underline"
      end

      private

      def render?
        href.present?
      end
    end
  end
end
