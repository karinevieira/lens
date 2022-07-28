# frozen_string_literal: true

module Form
  class LayoutComponent < ViewComponent::Base
    renders_one :header, "HeaderComponent"

    class HeaderComponent < ViewComponent::Base
      def call
        content_tag :div, class: "flex flex-col gap-2 mb-6" do
          content_tag :h2, content, class: "text-lg font-semibold text-gray-900"
        end
      end
    end
  end
end
