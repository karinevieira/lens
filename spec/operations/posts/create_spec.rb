# frozen_string_literal: true

require "rails_helper"

RSpec.describe Posts::Create, type: :operation do
  describe ".result" do
    context "when attributes are given" do
      it "is a success" do
        user = create(:user)
        attributes = {
          subtitle: "My test subtitle",
          image: Rack::Test::UploadedFile.new(Rails.root.join("spec/fixtures/files/image.png"), "image/png"),
          user_id: user.id
        }

        result = described_class.result(attributes: attributes)

        expect(result.success?).to be true
      end

      it "creates a new post with the given attributes" do
        user = create(:user)
        attributes = {
          subtitle: "My test subtitle",
          image: Rack::Test::UploadedFile.new(Rails.root.join("spec/fixtures/files/image.png"), "image/png"),
          user_id: user.id
        }

        result = described_class.result(attributes: attributes)

        expect(result.post.reload.attributes).to include("subtitle" => "My test subtitle")
      end

      it "change the post count" do
        user = create(:user)
        attributes = {
          subtitle: "My test subtitle",
          image: Rack::Test::UploadedFile.new(Rails.root.join("spec/fixtures/files/image.png"), "image/png"),
          user_id: user.id
        }

        expect { described_class.result(attributes: attributes) }.to change(Post, :count).by(1)
      end
    end
  end
end
