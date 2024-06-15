# frozen_string_literal: true

require "rails_helper"

RSpec.describe Posts::ActionsComponent, type: :component do
  context "when post has likes" do
    it "renders the red heart" do
      user = create(:user)
      post = create(:post)
      create(:like, user: user, post: post)
      rendered = render_inline(described_class.new(post: post, current_user: user))

      expect(rendered.to_html).to have_css("svg", class: "fill-red-500")
    end

    it "renders a button to dislike the post" do
      user = create(:user)
      post = create(:post)
      like = create(:like, user: user, post: post)
      rendered = render_inline(described_class.new(post: post, current_user: user))
      form_action = post_like_path(post, like)

      expect(rendered.to_html).to have_css("form[action='#{form_action}']")
    end
  end

  context "when post has no likes" do
    it "renders the empty heart" do
      user = build_stubbed(:user)
      post = build_stubbed(:post, id: SecureRandom.uuid)
      rendered = render_inline(described_class.new(post: post, current_user: user))

      expect(rendered.to_html).to have_css("svg", class: "stroke-gray-600 fill-transparent")
    end

    it "renders a button to like the post" do
      user = build_stubbed(:user)
      post = build_stubbed(:post, id: SecureRandom.uuid)
      rendered = render_inline(described_class.new(post: post, current_user: user))
      form_action = post_likes_path(post)

      expect(rendered.to_html).to have_css("form[action='#{form_action}']")
    end
  end

  it "renders the amount of likes on the post" do
    user = create(:user)
    post = create(:post)
    create(:like, user: user, post: post)
    rendered = render_inline(described_class.new(post: post, current_user: user))
    likes_count = I18n.t("posts.card_component.likes_count", count: post.likes.count)

    expect(rendered.to_html).to have_css("p", text: likes_count)
  end
end
