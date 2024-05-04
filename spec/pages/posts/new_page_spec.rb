# frozen_string_literal: true

require "rails_helper"

RSpec.describe Posts::NewPage, type: :page do
  it "renders without problems" do
    current_user = create(:user)
    rendered = render_inline(described_class.new(current_user: current_user, post: Post.new))
    expect(rendered.to_html).to be_present
  end
end
