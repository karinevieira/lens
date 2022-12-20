# frozen_string_literal: true

module Structure
  class CardComponent < ViewComponent::Base
    attr_reader :post

    with_collection_parameter :post

    def initialize(post:)
      @post = post
    end

    private

    def image
      image_tag(url_for(post.image)) if post.image.attached?
    end

    def edit_action
      render(Action::LinkComponent.new(href: edit_post_path(post))) { "Editar" }
    end

    def delete_action
      render(
        Action::LinkComponent.new(
          color: :red,
          href: post_path(post),
          data: { turbo_method: :delete, turbo_frame: "_top" }
        )
      ) { "Deletar" }
    end
  end
end
