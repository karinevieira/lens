# frozen_string_literal: true

module Posts
  class Like < Actor
    input :post_id, type: String
    input :user_id, type: String

    output :post, type: Post

    def call
      self.post = post
      like = post.likes.build(user_id: user_id)

      ActiveRecord::Base.transaction do
        like.save!
      end
    rescue StandardError
      fail_transition!
    end

    private

    def post
      @post ||= Posts::Find.result(id: post_id).post
    end

    def fail_transition!
      fail!(error: :cannot_like)
    end
  end
end
