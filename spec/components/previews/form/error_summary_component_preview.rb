# frozen_string_literal: true

module Form
  class ErrorSummaryComponentPreview < ViewComponent::Preview
    def default
      render Form::ErrorSummaryComponent.new do |summary|
        summary.error { "At least 10 characters (and up to 100 characters)" }
        summary.error { "At least one lowercase character" }
        summary.error { "Inclusion of at least one special character, e.g., ! @ # ?" }
      end
    end
  end
end
