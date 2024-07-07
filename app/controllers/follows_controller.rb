# frozen_string_literal: true

class FollowsController < ApplicationController
  def create
    result = Follows::Create.result(follower: current_user, followed: followed)

    if result.success?
      flash[:notice] = t(".notice", followed: username)
    else
      flash[:alert] = t(".alert", followed: username)
    end

    redirect_to user_path(username: username)
  end

  def destroy
    result = Follows::Destroy.result(follower: current_user, followed: followed)

    if result.success?
      flash[:notice] = t(".notice", followed: username)
    else
      flash[:alert] = t(".alert", followed: username)
    end

    redirect_to user_path(username: username)
  end

  private

  def followed
    @followed ||= Users::FindByUsername.result(username: username).user
  end

  def username
    params[:username]
  end
end
