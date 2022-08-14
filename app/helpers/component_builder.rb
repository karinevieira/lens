# frozen_string_literal: true

class ComponentBuilder < ActionView::Helpers::FormBuilder
  attr_reader :template

  delegate :render, to: :template

  def text_field_component(attribute, **args)
    render Form::InputComponent.new(**html_options(attribute), **args) do |slot|
      yield slot if block_given?
    end
  end

  def file_field_component(attribute, **args)
    self.multipart = true
    render Form::FileInputComponent.new(**html_options(attribute), **args) do |slot|
      yield slot if block_given?
    end
  end

  def label_component(attribute, content, **args)
    render(Form::LabelComponent.new(**label_options(attribute), **args)) { content }
  end

  def button_component(content, **args)
    render(Action::ButtonComponent.new(**args)) { content }
  end

  private

  def label_options(attribute)
    html_options(attribute).transform_keys({ id: :for })
  end

  def html_options(attribute)
    {
      name: name(attribute),
      id: id(attribute),
      value: object.send(attribute)
    }
  end

  def name(attribute)
    "#{object_name}[#{attribute}]"
  end

  def id(attribute)
    "#{object_name}_#{attribute}"
  end
end
