# frozen_string_literal: true

require "rails_helper"

RSpec.describe Application::NavbarComponent, type: :component do
  it "renders the Home item" do
    current_user = create(:user)

    rendered = render_inline(described_class.new(current_user: current_user, current_controller: "posts"))
    item_text = I18n.t("application.navbar_component.home")

    expect(rendered.to_html).to have_link(item_text, href: root_path)
  end

  it "renders the Search item" do
    current_user = create(:user)

    rendered = render_inline(described_class.new(current_user: current_user, current_controller: "posts"))
    item_text = I18n.t("application.navbar_component.search")

    expect(rendered.to_html).to have_link(item_text, href: "#")
  end

  it "renders the New item" do
    current_user = create(:user)

    rendered = render_inline(described_class.new(current_user: current_user, current_controller: "posts"))
    item_text = I18n.t("application.navbar_component.new")

    expect(rendered.to_html).to have_link(item_text, href: new_post_path)
  end

  it "renders the Profile item" do
    current_user = create(:user)

    rendered = render_inline(described_class.new(current_user: current_user, current_controller: "posts"))
    item_text = I18n.t("application.navbar_component.profile")

    expect(rendered.to_html).to have_link(item_text, href: user_path(username: current_user.profile.username))
  end

  it "renders the Sign out item" do
    current_user = create(:user)

    rendered = render_inline(described_class.new(current_user: current_user, current_controller: "posts"))
    item_text = I18n.t("application.navbar_component.sign_out")

    expect(rendered.to_html).to have_link(item_text, href: destroy_user_session_path)
  end
end
