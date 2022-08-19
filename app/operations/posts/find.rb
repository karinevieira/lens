# frozen_string_literal: true

module Posts
  class Find < Actor
    input :id, type: String

    output :post, type: Post

    def call
      self.post = Post.find(id)
    end
  end
end
