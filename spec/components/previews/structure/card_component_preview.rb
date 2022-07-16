# frozen_string_literal: true

module Structure
  class CardComponentPreview < ViewComponent::Preview
    # @param subtitle
    def playground(subtitle: "Photo subtitle")
      render Structure::CardComponent.new do |card|
        card.subtitle { subtitle }
      end
    end
  end
end
