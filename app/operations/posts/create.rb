# frozen_string_literal: true

module Posts
  class Create < Actor
    input :attributes, type: Hash

    output :post, type: Post

    def call
      self.post = Post.new(attributes)

      fail!(error: :invalid_record) unless post.save
    end
  end
end
