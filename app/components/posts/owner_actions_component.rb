# frozen_string_literal: true

module Posts
  class OwnerActionsComponent < ViewComponent::Base
    include ActionPolicy::Behaviour

    def initialize(post:, current_user:)
      @post = post
      @current_user = current_user
      @username = @post.user.profile_username
    end

    private

    attr_reader :post, :current_user, :username

    def render?
      post.subtitle.present?
    end

    def edit_action
      render(Action::LinkComponent.new(href: edit_post_path(post))) { t("posts.card_component.edit") }
    end

    def delete_action
      render(
        Action::LinkComponent.new(
          color: :red,
          href: post_path(post),
          data: { turbo_method: :delete, turbo_frame: "_top" }
        )
      ) { t("posts.card_component.delete") }
    end

    def show_action?(rule:)
      allowed_to?(rule, post, context: { user: current_user })
    end
  end
end
