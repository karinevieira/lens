# frozen_string_literal: true

module Form
  class ErrorSummaryComponent < ViewComponent::Base
    renders_many :errors
  end
end
