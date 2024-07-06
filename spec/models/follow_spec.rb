# frozen_string_literal: true

require "rails_helper"

RSpec.describe Follow do
  describe "associations" do
    it { is_expected.to belong_to(:follower).class_name("User").inverse_of(:follower_follows) }
    it { is_expected.to belong_to(:followed).class_name("User").inverse_of(:followed_follows) }
  end

  describe "validations" do
    it "validates uniqueness of the pair follower_id and followed_id" do
      follow = create(:follow)

      expect(follow).to validate_uniqueness_of(:follower).scoped_to(:followed_id)
    end

    context "when follower and followed are the same" do
      it "adds an error message to :base" do
        user = create(:user)
        follow = described_class.new(follower: user, followed: user)
        follow.valid?

        error_message = I18n.t("activerecord.errors.models.follow.follower_and_followed_cannot_be_the_same")

        expect(follow.errors[:base]).to include(error_message)
      end
    end

    context "when follower and followed aren't the same" do
      it "doesn't add an error message to :base" do
        follow = create(:follow)

        error_message = I18n.t("activerecord.errors.models.follow.follower_and_followed_cannot_be_the_same")

        expect(follow.errors[:base]).not_to include(error_message)
      end
    end
  end
end
