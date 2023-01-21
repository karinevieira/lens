# frozen_string_literal: true

module Structure
  class CardComponent < ViewComponent::Base
    include ActionPolicy::Behaviour

    attr_reader :post, :user

    with_collection_parameter :post

    def initialize(post:, user:)
      @post = post
      @user = user
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

    def show_action?(rule:)
      allowed_to?(rule, post, context: { user: user })
    end

    def already_liked?
      Like.exists?(user_id: user.id, post_id: post.id)
    end
  end
end
