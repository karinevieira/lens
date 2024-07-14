# frozen_string_literal: true

module Posts
  class FeedList < Actor
    input :current_user, type: User

    output :posts, type: Enumerable

    def call
      feed_posts = Post.where(user_id: feed_user_ids)

      self.posts = Posts::List.result(scope: feed_posts).posts
    end

    private

    def feed_user_ids
      following_users_ids = current_user.following.pluck(:id)
      following_users_ids.push(current_user.id)
    end
  end
end
