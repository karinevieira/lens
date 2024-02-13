# frozen_string_literal: true

require "rails_helper"

RSpec.describe Users::AvatarComponent, type: :component do
  context "when image_url is given" do
    it "renders user's avatar image" do
      rendered = render_inline(described_class.new(image_url: "https://i.pravatar.cc/150?img=3"))

      expect(rendered).to have_css("img[src*='https://i.pravatar.cc/150?img=3']")
    end
  end

  context "when image_url isn't given" do
    it "doesn't render user's avatar image" do
      rendered = render_inline(described_class.new(image_url: nil))

      expect(rendered.to_html).to be_empty
    end
  end
end
