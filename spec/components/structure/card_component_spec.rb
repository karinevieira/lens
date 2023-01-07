# frozen_string_literal: true

require "rails_helper"

RSpec.describe Structure::CardComponent, type: :component do
  it "renders the image" do
    post = build_stubbed(:post, id: SecureRandom.uuid)
    rendered = render_inline(described_class.new(post: post))

    expect(rendered.to_html).to have_css("img[src*='image.png']")
  end

  context "when subtitle is present" do
    it "renders the subtitle" do
      post = build_stubbed(:post, id: SecureRandom.uuid, subtitle: "My test subtitle")
      rendered = render_inline(described_class.new(post: post))

      expect(rendered.to_html).to have_css("p", text: "My test subtitle")
    end

    it "renders the edit action" do
      post = build_stubbed(:post, id: SecureRandom.uuid, subtitle: "My test subtitle")
      rendered = render_inline(described_class.new(post: post))

      expect(rendered.to_html).to have_link("Editar", href: edit_post_path(post))
    end

    it "renders the delete action" do
      post = build_stubbed(:post, id: SecureRandom.uuid, subtitle: "My test subtitle")
      rendered = render_inline(described_class.new(post: post))

      expect(rendered.to_html).to have_link("Deletar", href: post_path(post))
    end
  end

  context "when subtitle is empty" do
    it "doesn't render the subtitle" do
      post = build_stubbed(:post, id: SecureRandom.uuid, subtitle: nil)
      rendered = render_inline(described_class.new(post: post))

      expect(rendered.to_html).not_to have_css("p")
    end

    it "doesn't render the edit action" do
      post = build_stubbed(:post, id: SecureRandom.uuid, subtitle: nil)
      rendered = render_inline(described_class.new(post: post))

      expect(rendered.to_html).not_to have_link("Editar", href: edit_post_path(post))
    end

    it "doens't render the delete action" do
      post = build_stubbed(:post, id: SecureRandom.uuid, subtitle: nil)
      rendered = render_inline(described_class.new(post: post))

      expect(rendered.to_html).not_to have_link("Deletar", href: post_path(post))
    end
  end
end
