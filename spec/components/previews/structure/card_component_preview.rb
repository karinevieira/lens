# frozen_string_literal: true

module Structure
  class CardComponentPreview < ViewComponent::Preview
    # @param image
    # @param subtitle
    def playground(subtitle: "Photo subtitle", image: "https://flowbite.com/docs/images/blog/image-1.jpg")
      render Structure::CardComponent.new do |card|
        card.image { image }
        card.subtitle { subtitle }
      end
    end
  end
end
