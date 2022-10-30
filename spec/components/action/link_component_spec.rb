# frozen_string_literal: true

require "rails_helper"

RSpec.describe Action::LinkComponent, type: :component do
  it "renders" do
    rendered = render_inline(described_class.new(href: "#"))

    expect(rendered.to_html).to be_present
  end
end
