# frozen_string_literal: true

require "rails_helper"

RSpec.describe Form::LabelComponent, type: :component do
  context "when content is present" do
    subject(:rendered) { render_inline(described_class.new) { "Label" } }

    it "renders the label with content given" do
      expect(rendered.to_html).to have_content("Label")
    end
  end

  context "when content is empty" do
    subject(:rendered) { render_inline(described_class.new) }

    it "doesn't render" do
      expect(rendered.to_html).to be_empty
    end
  end
end
