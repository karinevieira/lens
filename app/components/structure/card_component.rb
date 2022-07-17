# frozen_string_literal: true

module Structure
  class CardComponent < ViewComponent::Base
    renders_one :image, "ImageComponent"
    renders_one :subtitle, "SubtitleComponent"

    def all_classes
      "max-w-sm bg-white rounded-lg border border-gray-200 shadow-md dark:bg-gray-800 dark:border-gray-700"
    end

    class SubtitleComponent < ViewComponent::Base
      def call
        classes = "mb-3 text-sm font-normal text-gray-700 dark:text-gray-400"
        content_tag :p, content, class: classes
      end
    end

    class ImageComponent < ViewComponent::Base
      def call
        image_tag(content)
      end
    end
  end
end
