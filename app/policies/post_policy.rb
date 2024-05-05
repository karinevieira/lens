# frozen_string_literal: true

class PostPolicy < ApplicationPolicy
  alias_rule :index?, :new?, to: :create?
  alias_rule :edit?, :destroy?, to: :update?

  def create?
    true
  end

  def update?
    deny_non_post_creators!

    true
  end

  def deny_non_post_creators!
    deny! if user != record.user
  end
end
