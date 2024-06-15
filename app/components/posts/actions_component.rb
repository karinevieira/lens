# frozen_string_literal: true

module Posts
  class ActionsComponent < ViewComponent::Base
    def initialize(post:, current_user:)
      @post = post
      @current_user = current_user
    end

    private

    attr_reader :post, :current_user

    def already_liked?
      ::Like.exists?(user_id: current_user.id, post_id: post.id)
    end

    def like
      ::Likes::Find.result(user_id: current_user.id, post_id: post.id).like
    end

    def likes_count_text
      t("posts.card_component.likes_count", count: post.likes.count)
    end
  end
end
