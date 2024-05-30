# frozen_string_literal: true

module Application
  class ErrorSummaryComponent < ViewComponent::Base
    def initialize(record:)
      @record = record
      @errors = record.errors.to_hash
    end

    private

    attr_reader :record, :errors

    def render?
      errors.any?
    end

    def format_error_message(attribute, message)
      "#{record.class.human_attribute_name(attribute)} #{message.to_sentence}"
    end
  end
end
