# frozen_string_literal: true

module Posts
  class Dislike < Actor
    input :post_id, type: String
    input :user_id, type: String

    def call
      fail_transition! unless already_liked?
      like.destroy
    end

    private

    def like
      ::Likes::Find.result(user_id: user_id, post_id: post_id).like
    end

    def already_liked?
      like.present?
    end

    def fail_transition!
      fail!(error: :cannot_dislike)
    end
  end
end
