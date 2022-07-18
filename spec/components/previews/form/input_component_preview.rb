# frozen_string_literal: true

module Form
  class InputComponentPreview < ViewComponent::Preview
    def default
      render Form::InputComponent.new(type: "text", id: "subtitle")
    end
  end
end
