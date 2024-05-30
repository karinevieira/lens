# frozen_string_literal: true

require "rails_helper"

RSpec.describe Form::ErrorSummaryComponent, type: :component do
  it "renders the title" do
    rendered = render_inline(described_class.new)

    expect(rendered).to have_text(I18n.t("form.error_summary_component.title"))
  end

  it "renders the provided error line" do
    rendered = render_inline(described_class.new) do |summary|
      summary.error { "My error line #1" }
      summary.error { "My error line #2" }
    end

    expect(rendered.to_html).to have_css("li", text: "My error line #1")
      .and have_css("li", text: "My error line #2")
  end
end
