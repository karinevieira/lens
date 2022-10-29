# frozen_string_literal: true

require "rails_helper"

RSpec.describe Action::ButtonComponent, type: :component do
  context "when content is present" do
    it "renders" do
      rendered = render_inline(described_class.new) { "Button content" }

      expect(rendered.to_html).to be_present
    end
  end

  context "when content is empty" do
    it "doesn't render" do
      rendered = render_inline(described_class.new)

      expect(rendered.to_html).to be_empty
    end
  end
end
