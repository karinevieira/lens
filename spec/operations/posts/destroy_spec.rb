# frozen_string_literal: true

require "rails_helper"

RSpec.describe Posts::Destroy, type: :operation do
  describe ".result" do
    context "when post with given id exists" do
      it "is a success" do
        post = create(:post)

        result = described_class.result(id: post.id)

        expect(result.success?).to be true
      end

      it "destroys post" do
        post = create(:post)

        described_class.result(id: post.id)

        expect { post.reload }.to raise_error(ActiveRecord::RecordNotFound)
      end

      it "changes post count" do
        post = create(:post)

        expect { described_class.result(id: post.id) }.to change(Post, :count).by(-1)
      end
    end

    context "when post with given id doesn't exists" do
      it "raises a ActiveRecord::RecordNotFound error" do
        expect do
          described_class.result(id: "not-found-id")
        end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
