# frozen_string_literal: true

require "rails_helper"

RSpec.describe Posts::IndexPage, type: :page do
  it "renders without problems" do
    posts = create_list(:post, 2)
    rendered = render_inline(described_class.new(posts: posts))
    expect(rendered.to_html).to be_present
  end
end
