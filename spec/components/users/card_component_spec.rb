# frozen_string_literal: true

require "rails_helper"

RSpec.describe Users::CardComponent, type: :component do
  context "when user has an avatar" do
    it "renders user's avatar image" do
      avatar = Rack::Test::UploadedFile.new(
        Rails.root.join("spec/fixtures/files/image.png"), "image/png"
      )
      profile = build_stubbed(:user_profile, avatar: avatar)
      user = build_stubbed(:user, profile: profile)

      rendered = render_inline(described_class.new(user: user))

      expect(rendered).to have_css("img[src*='image.png']")
    end
  end

  context "when user doesn't have an avatar" do
    it "renders default avatar image" do
      user = build_stubbed(:user)
      rendered = render_inline(described_class.new(user: user))

      expect(rendered).to have_css("img[src*='users/avatar']")
    end
  end

  it "renders user's username" do
    profile = build_stubbed(:user_profile, username: "niallhoran")
    user = build_stubbed(:user, profile: profile)

    rendered = render_inline(described_class.new(user: user))

    expect(rendered).to have_text("niallhoran")
  end

  it "renders user's display name" do
    profile = build_stubbed(:user_profile, display_name: "Niall Horan")
    user = build_stubbed(:user, profile: profile)

    rendered = render_inline(described_class.new(user: user))

    expect(rendered).to have_text("Niall Horan")
  end
end
