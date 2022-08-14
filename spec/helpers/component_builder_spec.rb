# frozen_string_literal: true

require "rails_helper"

RSpec.describe ComponentBuilder do
  describe "#text_field_component" do
    it "renders without problems" do
      builder = described_class.new(:post, Post.new, self, {})

      expect(builder.text_field_component(:subtitle)).to be_present
    end
  end

  describe "#file_field_component" do
    it "renders without problems" do
      builder = described_class.new(:post, Post.new, self, {})

      expect(builder.file_field_component(:subtitle)).to be_present
    end
  end

  describe "#label_component" do
    context "when content is present" do
      it "renders without problems" do
        builder = described_class.new(:post, Post.new, self, {})

        expect(builder.label_component(:subtitle, "Your subtitle")).to be_present
      end
    end

    context "when content is empty" do
      it "doesn't render" do
        builder = described_class.new(:post, Post.new, self, {})

        expect(builder.label_component(:subtitle, nil)).to be_empty
      end
    end
  end

  describe "#button_component" do
    context "when content is present" do
      it "renders without problems" do
        builder = described_class.new(:post, Post.new, self, {})

        expect(builder.button_component("Create post")).to be_present
      end
    end

    context "when content is empty" do
      it "doesn't render" do
        builder = described_class.new(:post, Post.new, self, {})

        expect(builder.button_component(nil)).to be_empty
      end
    end
  end
end
