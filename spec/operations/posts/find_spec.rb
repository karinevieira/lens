# frozen_string_literal: true

require "rails_helper"

RSpec.describe Posts::Find, type: :operation do
  describe ".result" do
    context "when post with given id exists" do
      it "is a success" do
        post = create(:post)

        result = described_class.result(id: post.id)

        expect(result.success?).to be true
      end

      it "returns found post for given id" do
        post = create(:post)

        result = described_class.result(id: post.id)

        expect(result.post).to eq(post)
      end
    end

    context "when post with given id doesn't exists" do
      it "raises ActiveRecord::RecordNotFound error" do
        expect do
          described_class.result(id: "not-found-id")
        end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
