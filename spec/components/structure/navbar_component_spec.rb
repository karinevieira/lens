# frozen_string_literal: true

require "rails_helper"

RSpec.describe Structure::NavbarComponent, type: :component do
  it "renders slot items" do
    rendered = render_inline(described_class.new) do |nav|
      nav.item(href: "#", title: "Test item")
    end

    expect(rendered.to_html).to have_link("Test item", href: "#")
  end
end
