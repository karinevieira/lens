# frozen_string_literal: true

require "rails_helper"

RSpec.describe Posts::OwnerActionsComponent, type: :component do
  context "when subtitle is present" do
    it "renders the subtitle" do
      user = build_stubbed(:user)
      post = build_stubbed(:post, id: SecureRandom.uuid, subtitle: "My test subtitle")
      rendered = render_inline(described_class.new(post: post, current_user: user))

      expect(rendered.to_html).to have_css("p", text: "My test subtitle")
    end

    context "when current user is the post creator" do
      it "renders a link to edit the post" do
        user = build_stubbed(:user)
        post = build_stubbed(:post, id: SecureRandom.uuid, subtitle: "My test subtitle")
        component = described_class.new(post: post, current_user: user)

        allow(component).to receive(:allowed_to?).with(:edit?, post, context: { user: user }).and_return(true)
        allow(component).to receive(:allowed_to?).with(:destroy?, post, context: { user: user }).and_return(true)

        rendered = render_inline(component)
        link_text = I18n.t("posts.card_component.edit")

        expect(rendered.to_html).to have_link(link_text, href: edit_post_path(post))
      end

      it "renders a link to delete the post" do
        user = build_stubbed(:user)
        post = build_stubbed(:post, id: SecureRandom.uuid, subtitle: "My test subtitle")
        component = described_class.new(post: post, current_user: user)

        allow(component).to receive(:allowed_to?).with(:edit?, post, context: { user: user }).and_return(true)
        allow(component).to receive(:allowed_to?).with(:destroy?, post, context: { user: user }).and_return(true)

        rendered = render_inline(component)
        link_text = I18n.t("posts.card_component.delete")

        expect(rendered.to_html).to have_link(link_text, href: post_path(post))
      end
    end

    context "when user isn't the post creator" do
      it "doesn't render a link to edit the post" do
        user = build_stubbed(:user)
        post = build_stubbed(:post, id: SecureRandom.uuid, subtitle: "My subtitle")
        component = described_class.new(post: post, current_user: user)

        allow(component).to receive(:allowed_to?).with(:edit?, post, context: { user: user }).and_return(false)
        allow(component).to receive(:allowed_to?).with(:destroy?, post, context: { user: user }).and_return(false)

        rendered = render_inline(component)
        link_text = I18n.t("posts.card_component.edit")

        expect(rendered.to_html).not_to have_link(link_text, href: edit_post_path(post))
      end

      it "doesn't render a link to delete the post" do
        user = build_stubbed(:user)
        post = build_stubbed(:post, id: SecureRandom.uuid, subtitle: "My subtitle")
        component = described_class.new(post: post, current_user: user)

        allow(component).to receive(:allowed_to?).with(:edit?, post, context: { user: user }).and_return(false)
        allow(component).to receive(:allowed_to?).with(:destroy?, post, context: { user: user }).and_return(false)

        rendered = render_inline(component)
        link_text = I18n.t("posts.card_component.delete")

        expect(rendered.to_html).not_to have_link(link_text, href: post_path(post))
      end
    end
  end

  context "when subtitle is empty" do
    it "doesn't render the component" do
      user = build_stubbed(:user)
      post = build_stubbed(:post, id: SecureRandom.uuid, subtitle: nil)
      rendered = render_inline(described_class.new(post: post, current_user: user))

      expect(rendered.to_html).to be_empty
    end
  end
end
