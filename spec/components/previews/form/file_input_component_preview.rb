# frozen_string_literal: true

module Form
  class FileInputComponentPreview < ViewComponent::Preview
    # @param content
    def playground(content: nil)
      render Form::FileInputComponent.new do |input|
        input.label { content }
      end
    end
  end
end
