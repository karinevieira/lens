# frozen_string_literal: true

require "rails_helper"

RSpec.describe Users::ProfileStatsComponent, type: :component do
  it "renders user's profile stats" do
    rendered = render_inline(
      described_class.new(
        stats: [
          { title: "Postagens", count: 100 },
          { title: "Seguidores", count: 1000 },
          { title: "Seguindo", count: 500 }
        ]
      )
    )

    expect(rendered).to have_text("Postagens")
      .and have_text("100")
      .and have_text("Seguidores")
      .and have_text("1000")
      .and have_text("Seguindo")
      .and have_text("500")
  end
end
