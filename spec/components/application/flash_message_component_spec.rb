# frozen_string_literal: true

require "rails_helper"

RSpec.describe Application::FlashMessageComponent, type: :component do
  it "renders a flash message with the given message" do
    rendered = render_inline(described_class.new(flash: { notice: "Everything is alright!" }))

    expect(rendered).to have_text("Everything is alright")
  end
end
