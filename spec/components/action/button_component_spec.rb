# frozen_string_literal: true

require "rails_helper"

RSpec.describe Action::ButtonComponent, type: :component do
  context "when content is present" do
    subject(:rendered) { render_inline(described_class.new) { "Button content" } }

    it "renders without problems" do
      expect(rendered.to_html).to be_present
    end
  end

  context "when content is empty" do
    subject(:rendered) { render_inline(described_class.new) }

    it "doesn't render" do
      expect(rendered.to_html).to be_empty
    end
  end
end
