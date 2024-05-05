# frozen_string_literal: true

class ProfilePolicy < ApplicationPolicy
  alias_rule :edit?, to: :update?

  def update?
    record.user == user
  end
end
