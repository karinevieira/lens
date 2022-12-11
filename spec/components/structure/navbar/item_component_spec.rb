# frozen_string_literal: true

require "rails_helper"

RSpec.describe Structure::Navbar::ItemComponent, type: :component do
  it "renders without problems" do
    rendered = render_inline(described_class.new(href: "#", title: "Test"))

    expect(rendered.to_html).to be_present
  end
end
