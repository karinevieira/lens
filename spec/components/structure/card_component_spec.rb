# frozen_string_literal: true

require "rails_helper"

RSpec.describe Structure::CardComponent, type: :component do
  it "renders without problems" do
    post = create(:post)
    rendered = render_inline(described_class.new(post: post))

    expect(rendered.to_html).to be_present
  end
end
