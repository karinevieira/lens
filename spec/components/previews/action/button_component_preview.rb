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
      render(Action::ButtonComponent.new(tag: :a, href: "http://localhost:3000")) { "Edit post" }
    end
    # @!endgroup

    # @!group Colors
    # @label Blue
    def with_blue_color
      render(Action::ButtonComponent.new(color: :blue)) { "Create post" }
    end

    # @label Green
    def with_white_color
      render(Action::ButtonComponent.new(color: :green)) { "Edit post" }
    end

    # @label Red
    def with_red_color
      render(Action::ButtonComponent.new(color: :red)) { "Destroy post" }
    end
    # @!endgroup
  end
end
