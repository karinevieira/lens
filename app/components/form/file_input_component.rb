# frozen_string_literal: true

module Form
  class FileInputComponent < ViewComponent::Base
    attr_reader :html_options

    renders_one :label, Form::LabelComponent

    def initialize(**html_options)
      @html_options = html_options
    end

    private

    def container_classes
      "flex justify-center items-center w-full"
    end

    def label_classes
      "flex flex-col justify-center items-center w-full h-64 bg-gray-50 rounded-lg border-2 border-gray-300
      border-dashed cursor-pointer dark:hover:bg-bray-800 dark:bg-gray-700 hover:bg-gray-100
      dark:border-gray-600 dark:hover:border-gray-500 dark:hover:bg-gray-600".squish
    end

    def div_classes
      "flex flex-col justify-center items-center pt-5 pb-6"
    end

    def p_classes
      "mb-2 text-sm text-gray-500 dark:text-gray-400"
    end

    def file_input_class
      "hidden"
    end
  end
end
