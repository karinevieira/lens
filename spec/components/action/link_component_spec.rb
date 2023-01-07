# frozen_string_literal: true

require "rails_helper"

RSpec.describe Action::LinkComponent, type: :component do
  it "renders" do
    rendered = render_inline(described_class.new(href: "#")) { "Test" }

    expect(rendered.to_html).to have_link("Test", href: "#")
  end
end
