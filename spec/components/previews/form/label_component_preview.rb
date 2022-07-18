# frozen_string_literal: true

module Form
  class LabelComponentPreview < ViewComponent::Preview
    def default
      render(Form::LabelComponent.new(for: "subtitle")) { "Your subtitle" }
    end
  end
end
