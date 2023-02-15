# frozen_string_literal: true

require "rails_helper"

RSpec.describe Structure::CardComponent, type: :component do
  it "renders the image" do
    user = build_stubbed(:user)
    post = build_stubbed(:post, id: SecureRandom.uuid)
    rendered = render_inline(described_class.new(post: post, user: user))

    expect(rendered.to_html).to have_css("img[src*='image.png']")
  end

  context "when post has likes" do
    it "renders the red heart" do
      user = create(:user)
      post = create(:post)
      create(:like, user: user, post: post)
      rendered = render_inline(described_class.new(post: post, user: user))

      expect(rendered.to_html).to have_css("svg", class: "fill-red-500")
    end

    it "renders a button to dislike the post" do
      user = create(:user)
      post = create(:post)
      like = create(:like, user: user, post: post)
      rendered = render_inline(described_class.new(post: post, user: user))
      form_action = post_like_path(post, like)

      expect(rendered.to_html).to have_css("form[action='#{form_action}']")
    end
  end

  context "when post has no likes" do
    it "renders the empty heart" do
      user = build_stubbed(:user)
      post = build_stubbed(:post, id: SecureRandom.uuid)
      rendered = render_inline(described_class.new(post: post, user: user))

      expect(rendered.to_html).to have_css("svg", class: "stroke-gray-600 fill-transparent")
    end

    it "renders a button to like the post" do
      user = build_stubbed(:user)
      post = build_stubbed(:post, id: SecureRandom.uuid)
      rendered = render_inline(described_class.new(post: post, user: user))
      form_action = post_likes_path(post)

      expect(rendered.to_html).to have_css("form[action='#{form_action}']")
    end
  end

  it "renders the amount of likes on the post" do
    user = create(:user)
    post = create(:post)
    create(:like, user: user, post: post)
    rendered = render_inline(described_class.new(post: post, user: user))
    likes_count = I18n.t("structure.card_component.likes_count", count: post.likes.count)

    expect(rendered.to_html).to have_css("p", text: likes_count)
  end

  context "when subtitle is present" do
    it "renders the subtitle" do
      user = build_stubbed(:user)
      post = build_stubbed(:post, id: SecureRandom.uuid, subtitle: "My test subtitle")
      rendered = render_inline(described_class.new(post: post, user: user))

      expect(rendered.to_html).to have_css("p", text: "My test subtitle")
    end
  end

  context "when subtitle is empty" do
    it "doesn't render the subtitle" do
      user = build_stubbed(:user)
      post = build_stubbed(:post, id: SecureRandom.uuid, subtitle: nil)
      rendered = render_inline(described_class.new(post: post, user: user))

      expect(rendered.to_html).not_to have_selector("turbo-frame")
    end
  end

  context "when current user is the post creator" do
    it "renders a link to edit the post" do
      user = build_stubbed(:user)
      post = build_stubbed(:post, id: SecureRandom.uuid, subtitle: "My test subtitle")
      component = described_class.new(post: post, user: user)

      allow(component).to receive(:allowed_to?).with(:edit?, post, context: { user: user }).and_return(true)
      allow(component).to receive(:allowed_to?).with(:destroy?, post, context: { user: user }).and_return(true)

      rendered = render_inline(component)
      link_text = I18n.t("structure.card_component.edit")

      expect(rendered.to_html).to have_link(link_text, href: edit_post_path(post))
    end

    it "renders a link to delete the post" do
      user = build_stubbed(:user)
      post = build_stubbed(:post, id: SecureRandom.uuid, subtitle: "My test subtitle")
      component = described_class.new(post: post, user: user)

      allow(component).to receive(:allowed_to?).with(:edit?, post, context: { user: user }).and_return(true)
      allow(component).to receive(:allowed_to?).with(:destroy?, post, context: { user: user }).and_return(true)

      rendered = render_inline(component)
      link_text = I18n.t("structure.card_component.delete")

      expect(rendered.to_html).to have_link(link_text, href: post_path(post))
    end
  end

  context "when user isn't the post creator" do
    it "doesn't render a link to edit the post" do
      user = build_stubbed(:user)
      post = build_stubbed(:post, id: SecureRandom.uuid, subtitle: "My subtitle")
      component = described_class.new(post: post, user: user)

      allow(component).to receive(:allowed_to?).with(:edit?, post, context: { user: user }).and_return(false)
      allow(component).to receive(:allowed_to?).with(:destroy?, post, context: { user: user }).and_return(false)

      rendered = render_inline(component)
      link_text = I18n.t("structure.card_component.edit")

      expect(rendered.to_html).not_to have_link(link_text, href: edit_post_path(post))
    end

    it "doesn't render a link to delete the post" do
      user = build_stubbed(:user)
      post = build_stubbed(:post, id: SecureRandom.uuid, subtitle: "My subtitle")
      component = described_class.new(post: post, user: user)

      allow(component).to receive(:allowed_to?).with(:edit?, post, context: { user: user }).and_return(false)
      allow(component).to receive(:allowed_to?).with(:destroy?, post, context: { user: user }).and_return(false)

      rendered = render_inline(component)
      link_text = I18n.t("structure.card_component.delete")

      expect(rendered.to_html).not_to have_link(link_text, href: post_path(post))
    end
  end
end
