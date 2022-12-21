# frozen_string_literal: true

class PostPolicy < ApplicationPolicy
  def index?
    true
  end

  def new?
    true
  end

  def create?
    true
  end

  def edit?
    deny_non_post_creators!

    true
  end

  def update?
    deny_non_post_creators!

    true
  end

  def destroy?
    deny_non_post_creators!

    true
  end

  def deny_non_post_creators!
    deny! if user != record.user
  end
end
