# frozen_string_literal: true

module Posts
  class Update < Actor
    input :attributes, type: Hash
    input :id, type: String

    output :post, type: Post

    def call
      self.post = find_post

      fail!(error: :invalid_record) unless post.update(attributes)
    end

    private

    def find_post
      Posts::Find.result(id: id).post
    end
  end
end
