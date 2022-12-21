# frozen_string_literal: true

require "rails_helper"

RSpec.describe PostPolicy do
  describe "#index?" do
    it "allows everyone to see the posts" do
      current_user = build_stubbed(:user)
      post = build_stubbed(:post, user: current_user)
      policy = described_class.new(post, user: current_user)

      result = policy.apply(:index?)

      expect(result).to be true
    end
  end

  describe "#new?" do
    it "allows everyone to access the page to create a post" do
      current_user = build_stubbed(:user)
      post = build_stubbed(:post, user: current_user)
      policy = described_class.new(post, user: current_user)

      result = policy.apply(:new?)

      expect(result).to be true
    end
  end

  describe "#create?" do
    it "allows everyone to create a post" do
      current_user = build_stubbed(:user)
      post = build_stubbed(:post, user: current_user)
      policy = described_class.new(post, user: current_user)

      result = policy.apply(:create?)

      expect(result).to be true
    end
  end

  describe "#edit?" do
    context "when current user is the post creator" do
      it "allows to access the page to edit the post" do
        current_user = build_stubbed(:user)
        post = build_stubbed(:post, user: current_user)
        policy = described_class.new(post, user: current_user)

        result = policy.apply(:edit?)

        expect(result).to be true
      end
    end

    context "when current user isn't the post creator" do
      it "not allow to access the page to edit the post" do
        current_user = build_stubbed(:user)
        creator = build_stubbed(:user)
        post = build_stubbed(:post, user: creator)
        policy = described_class.new(post, user: current_user)

        result = policy.apply(:edit?)

        expect(result).to be false
      end
    end
  end

  describe "#update?" do
    context "when current user is the post creator" do
      it "allows to update the post" do
        current_user = build_stubbed(:user)
        post = build_stubbed(:post, user: current_user)
        policy = described_class.new(post, user: current_user)

        result = policy.apply(:update?)

        expect(result).to be true
      end
    end

    context "when current user isn't the post creator" do
      it "not allow to update the post" do
        current_user = build_stubbed(:user)
        creator = build_stubbed(:user)
        post = build_stubbed(:post, user: creator)
        policy = described_class.new(post, user: current_user)

        result = policy.apply(:update?)

        expect(result).to be false
      end
    end
  end

  describe "#destroy?" do
    context "when current user is the post creator" do
      it "allows to destroy the post" do
        current_user = build_stubbed(:user)
        post = build_stubbed(:post, user: current_user)
        policy = described_class.new(post, user: current_user)

        result = policy.apply(:destroy?)

        expect(result).to be true
      end
    end

    context "when current user isn't the post creator" do
      it "not allow to delete the post" do
        current_user = build_stubbed(:user)
        creator = build_stubbed(:user)
        post = build_stubbed(:post, user: creator)
        policy = described_class.new(post, user: current_user)

        result = policy.apply(:destroy?)

        expect(result).to be false
      end
    end
  end
end
