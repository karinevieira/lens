# frozen_string_literal: true

module Posts
  class List < Actor
    output :posts, type: Enumerable

    def call
      self.posts = Post.order(created_at: :desc).all
    end
  end
end
