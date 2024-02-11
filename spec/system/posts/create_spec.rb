# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Create post" do
  context "with valid form" do
    it "creates a new post" do
      sign_in

      visit root_path

      click_on(I18n.t("application.navbar_component.new"))
      attach_file("post_image", Rails.root.join("spec/fixtures/files/image.png"), make_visible: true)
      fill_in I18n.t("posts.new_page.subtitle"), with: "test subtitle"
      click_link_or_button(I18n.t("posts.new_page.create_post"))

      expect(page).to have_text("test subtitle")
        .and have_css("img[src*='image.png']")
        .and have_text("Publicação criada com sucesso")
    end
  end

  context "with invalid form" do
    it "re-renders form with error" do
      skip "it needs to be implemented"
    end
  end
end
