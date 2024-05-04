# frozen_string_literal: true

require "rails_helper"

RSpec.describe Users::AvatarComponent, type: :component do
  context "when user has an avatar" do
    it "renders user's avatar image" do
      avatar = Rack::Test::UploadedFile.new(
        Rails.root.join("spec/fixtures/files/image.png"), "image/png"
      )
      profile = create(:user_profile, avatar: avatar)
      user = create(:user, profile: profile)

      rendered = render_inline(described_class.new(user: user))

      expect(rendered).to have_css("img[src*='image.png']")
    end
  end

  context "when user doesn't have an avatar" do
    it "renders default avatar" do
      user = create(:user)
      rendered = render_inline(described_class.new(user: user))

      expect(rendered).to have_css("img[src*='users/avatar']")
    end
  end
end
