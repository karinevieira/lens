# frozen_string_literal: true

require "rails_helper"

RSpec.describe Posts::ImageComponent, type: :component do
  it "renders the image" do
    post = build_stubbed(:post)
    rendered = render_inline(described_class.new(post: post))

    expect(rendered.to_html).to have_css("img[src*='image.png']")
  end
end
