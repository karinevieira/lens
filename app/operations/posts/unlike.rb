# frozen_string_literal: true

module Posts
  class Unlike < Actor
    input :post_id, type: String
    input :user_id, type: String

    def call
      fail_transition! unless already_liked?
      like.destroy
    end

    private

    def like
      ::Like.find_by(user_id: user_id, post_id: post_id)
    end

    def already_liked?
      like.present?
    end

    def fail_transition!
      fail!(error: :cannot_unlike)
    end
  end
end
