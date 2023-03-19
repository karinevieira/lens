# frozen_string_literal: true

require "rails_helper"

RSpec.describe Feedback::BannerComponent, type: :component do
  it "renders the given message" do
    rendered = render_inline(described_class.new(type: :notice)) { "Some message" }

    expect(rendered).to have_text("Some message")
  end
end
