# frozen_string_literal: true

module Form
  class InputComponentPreview < ViewComponent::Preview
    # @param label
    # @param type
    # @param id
    def playground(label: nil, type: "text", id: nil)
      render Form::InputComponent.new(type:, id:) do |input|
        input.label { label }
      end
    end
  end
end
