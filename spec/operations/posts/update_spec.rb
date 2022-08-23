# frozen_string_literal: true

require "rails_helper"

RSpec.describe Posts::Update, type: :operation do
  describe ".result" do
    context "when post with given id exists" do
      it "is a success" do
        post = create(:post)
        attributes = { subtitle: "Test subtitle" }

        result = described_class.result(attributes: attributes, id: post.id)

        expect(result.success?).to be true
      end

      it "updates post with given attributes" do
        post = create(:post, subtitle: "Old subtitle")
        attributes = { subtitle: "New subtitle" }

        result = described_class.result(attributes: attributes, id: post.id)

        expect(result.post.reload.attributes).to include("subtitle" => "New subtitle")
      end
    end

    context "when post with given id doesn't exists" do
      it "raises ActiveRecord::RecordNotFound error" do
        attributes = { subtitle: "Test subtitle" }

        expect do
          described_class.result(attributes: attributes, id: "not-found-id")
        end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
