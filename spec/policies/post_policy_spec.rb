# frozen_string_literal: true

require "rails_helper"

RSpec.describe PostPolicy do
  describe "#index?" do
    it "is an alias of :create? authorization rule" do
      current_user = build_stubbed(:user)
      post = build_stubbed(:post)

      policy = described_class.new(post, user: current_user)
      rule = :index?

      expect(rule).to be_an_alias_of(policy, :create?)
    end
  end

  describe "#new?" do
    it "is an alias of :create? authorization rule" do
      current_user = build_stubbed(:user)
      post = build_stubbed(:post)

      policy = described_class.new(post, user: current_user)
      rule = :new?

      expect(rule).to be_an_alias_of(policy, :create?)
    end
  end

  describe "#create?" do
    it "allows everyone to create a post" do
      current_user = build_stubbed(:user)
      post = build_stubbed(:post)
      policy = described_class.new(post, user: current_user)

      result = policy.apply(:create?)

      expect(result).to be true
    end
  end

  describe "#edit?" do
    it "is an alias of :update? authorization rule" do
      current_user = build_stubbed(:user)
      post = build_stubbed(:post, user: current_user)

      policy = described_class.new(post, user: current_user)
      rule = :edit?

      expect(rule).to be_an_alias_of(policy, :update?)
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
    it "is an alias of :update? authorization rule" do
      current_user = build_stubbed(:user)
      post = build_stubbed(:post, user: current_user)

      policy = described_class.new(post, user: current_user)
      rule = :destroy?

      expect(rule).to be_an_alias_of(policy, :update?)
    end
  end
end
