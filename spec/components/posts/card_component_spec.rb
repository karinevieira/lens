# frozen_string_literal: true

require "rails_helper"

RSpec.describe Posts::CardComponent, type: :component do
  it "renders the image" do
    user = build_stubbed(:user)
    post = build_stubbed(:post, id: SecureRandom.uuid)
    rendered = render_inline(described_class.new(post: post, user: user))

    expect(rendered.to_html).to have_css("img[src*='image.png']")
  end

  it "renders the post owner's username with a link to visit their profile" do
    user = build_stubbed(:user)
    post = build_stubbed(:post, id: SecureRandom.uuid)
    owner_username = post.user.profile.username
    rendered = render_inline(described_class.new(post: post, user: user))

    expect(rendered).to have_link(owner_username, href: user_path(owner_username))
  end

  it "renders the actions for the current user" do
    user = build_stubbed(:user)
    post = build_stubbed(:post, id: SecureRandom.uuid)
    actions = render_inline(Posts::ActionsComponent.new(post: post, current_user: user))
    rendered = render_inline(described_class.new(post: post, user: user))

    expect(rendered.to_html).to include(actions.to_html)
  end

  it "renders the actions for the owner" do
    user = build_stubbed(:user)
    post = build_stubbed(:post, id: SecureRandom.uuid)
    owner_actions = render_inline(Posts::OwnerActionsComponent.new(post: post, current_user: user))
    rendered = render_inline(described_class.new(post: post, user: user))

    expect(rendered.to_html).to include(owner_actions.to_html)
  end
end
