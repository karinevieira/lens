# frozen_string_literal: true

require "rails_helper"

RSpec.describe Structure::NavbarComponent, type: :component do
  it "renders without problemas" do
    rendered = render_inline(described_class.new)

    expect(rendered.to_html).to be_present
  end
end
