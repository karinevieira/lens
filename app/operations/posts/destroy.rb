# frozen_string_literal: true

module Posts
  class Destroy < Actor
    input :id, type: String

    def call
      post = find_post

      fail!(error: :record_not_destroyed) unless post.destroy
    end

    private

    def find_post
      Posts::Find.result(id: id).post
    end
  end
end
