# frozen_string_literal: true

module Posts
  class List < Actor
    input :scope, type: ActiveRecord::Relation

    output :posts, type: Enumerable

    def call
      self.posts = scope.order(created_at: :desc)
    end
  end
end
