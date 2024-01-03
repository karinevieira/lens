# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Update post" do
  context "with valid form" do
    it "updates the post" do
      user = sign_in
      create(:post, user: user)

      visit root_path

      click_link(I18n.t("structure.card_component.edit"))
      fill_in "Your subtitle", with: "test subtitle"
      click_button("Edit post")

      expect(page).to have_text("test subtitle")
    end
  end

  context "with invalid form" do
    it "re-renders form with error" do
      skip "it needs to be implemented"
    end
  end
end
