# frozen_string_literal: true

require "rails_helper"

RSpec.describe Users::GalleryComponent, type: :component do
  it "renders the user's post images" do
    user = create(:user)
    create(:post, user: user)
    create(:post, user: user, image: upload_image("image_b.png"))

    rendered = render_inline(described_class.new(posts: user.posts))

    expect(rendered.to_html).to have_css("img[src*='image.png']")
      .and have_css("img[src*='image_b.png']")
  end

  def upload_image(path)
    Rack::Test::UploadedFile.new(Rails.root.join("spec/fixtures/files/#{path}"), "image/png")
  end
end
