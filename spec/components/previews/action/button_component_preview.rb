# frozen_string_literal: true

module Action
  class ButtonComponentPreview < ViewComponent::Preview
    # @!group Types
    # @label Button tag
    def default
      render(Action::ButtonComponent.new) { "Create post" }
    end

    # @label Link tag
    def with_link_tag
      render(Action::ButtonComponent.new(tag: :link, href: "http://localhost:3000")) { "Go to home" }
    end
    # @!endgroup

    # @!group Colors
    # @label Blue
    def with_blue_color
      render(Action::ButtonComponent.new) { "Create post" }
    end

    # @label White
    def with_white_color
      render(Action::ButtonComponent.new(color: :white, tag: :link, href: "http://localhost:3000")) { "Edit post" }
    end
    # @!endgroup
  end
end
