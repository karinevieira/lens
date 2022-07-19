# frozen_string_literal: true

module Form
  class FileInputComponentPreview < ViewComponent::Preview
    def default
      render Form::FileInputComponent.new
    end
  end
end
