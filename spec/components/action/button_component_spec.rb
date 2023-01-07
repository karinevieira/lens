# frozen_string_literal: true

require "rails_helper"

RSpec.describe Action::ButtonComponent, type: :component do
  context "when content is present" do
    it "renders the button with the given content" do
      rendered = render_inline(described_class.new) { "Button content" }

      expect(rendered.to_html).to have_content("Button content")
    end
  end

  context "when content is empty" do
    it "doesn't render the button" do
      rendered = render_inline(described_class.new)

      expect(rendered.to_html).to be_empty
    end
  end
end
