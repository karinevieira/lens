# frozen_string_literal: true

require "rails_helper"

RSpec.describe Posts::List, type: :operation do
  describe ".result" do
    it "is successful" do
      result = described_class.result(scope: Post.all)

      expect(result.success?).to be true
    end

    it "returns a post list in descending order" do
      first_post = create(:post, subtitle: "First post")
      second_post = create(:post, subtitle: "Second post")
      third_post = create(:post, subtitle: "Third post")

      result = described_class.result(scope: Post.all)

      expect(result.posts.to_a).to eq [third_post, second_post, first_post]
    end
  end
end
