# frozen_string_literal: true

module Action
  class LinkComponentPreview < ViewComponent::Preview
    # @!group Colors

    # @label Blue
    def default
      render(Action::LinkComponent.new(color: :blue, href: "#")) { "Editar" }
    end

    # @label Green
    def with_green_color
      render(Action::LinkComponent.new(color: :green, href: "#")) { "Salvar" }
    end

    # @label Red
    def with_red_color
      render(Action::LinkComponent.new(color: :red, href: "#")) { "Excluir" }
    end
    # @!endgroup
  end
end
