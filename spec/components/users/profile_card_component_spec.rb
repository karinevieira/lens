# frozen_string_literal: true

require "rails_helper"

RSpec.describe Users::ProfileCardComponent, type: :component do
  context "when profile has an avatar" do
    it "renders profile's avatar image" do
      avatar = Rack::Test::UploadedFile.new(
        Rails.root.join("spec/fixtures/files/image.png"), "image/png"
      )
      profile = build_stubbed(:user_profile, avatar: avatar)

      rendered = render_inline(described_class.new(profile: profile))

      expect(rendered).to have_css("img[src*='image.png']")
    end
  end

  context "when profile doesn't have an avatar" do
    it "renders default avatar image" do
      profile = build_stubbed(:user_profile, avatar: nil)
      rendered = render_inline(described_class.new(profile: profile))

      expect(rendered).to have_css("img[src*='users/avatar']")
    end
  end

  it "contains link to visit the profile page" do
    profile = build_stubbed(:user_profile, username: "niallhoran")

    rendered = render_inline(described_class.new(profile: profile))

    expect(rendered).to have_link(href: user_path(profile.username))
  end

  it "renders profile's username" do
    profile = build_stubbed(:user_profile, username: "niallhoran")

    rendered = render_inline(described_class.new(profile: profile))

    expect(rendered).to have_text("niallhoran")
  end

  it "renders profile's display name" do
    profile = build_stubbed(:user_profile, display_name: "Niall Horan")

    rendered = render_inline(described_class.new(profile: profile))

    expect(rendered).to have_text("Niall Horan")
  end
end
