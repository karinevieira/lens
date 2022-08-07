# frozen_string_literal: true

require "rails_helper"

RSpec.describe Posts::NewPage, type: :page do
  subject(:rendered) { render_inline(described_class.new(post: Post.new)) }

  it "renders without problems" do
    expect(rendered.to_html).to be_present
  end
end
