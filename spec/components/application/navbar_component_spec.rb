# frozen_string_literal: true

require "rails_helper"

RSpec.describe Application::NavbarComponent, type: :component do
  it "renders the Home item" do
    rendered = render_inline(described_class.new)

    expect(rendered.to_html).to have_link("Home", href: root_path)
  end

  it "renders the Search item" do
    rendered = render_inline(described_class.new)

    expect(rendered.to_html).to have_link("Search", href: "#")
  end

  it "renders the New item" do
    rendered = render_inline(described_class.new)

    expect(rendered.to_html).to have_link("New", href: new_post_path)
  end

  it "renders the Profile item" do
    rendered = render_inline(described_class.new)

    expect(rendered.to_html).to have_link("Profile", href: "#")
  end

  it "renders the Sign out item" do
    rendered = render_inline(described_class.new)

    expect(rendered.to_html).to have_link("Sign out", href: destroy_user_session_path)
  end
end
