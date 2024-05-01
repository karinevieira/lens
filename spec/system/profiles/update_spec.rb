# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Update profile" do
  context "with valid form" do
    it "updates the profile" do
      sign_in

      visit edit_profile_path

      fill_in I18n.t("profiles.edit_page.display_name"), with: "John Doe"
      fill_in I18n.t("profiles.edit_page.bio"), with: "Software Engineer"
      click_button I18n.t("profiles.edit_page.update_profile")

      expect(page).to have_text("John Doe")
        .and have_text("Software Engineer")
        .and have_text(I18n.t("profiles.update.notice"))
    end
  end

  context "with invalid form" do
    it "re-renders form with error" do
      skip "it needs to be implemented"
    end
  end
end
