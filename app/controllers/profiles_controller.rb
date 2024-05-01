# frozen_string_literal: true

class ProfilesController < ApplicationController
  def edit
    respond_to do |format|
      format.html { render Profiles::EditPage.new(user: current_user) }
    end
  end

  def update
    result = UserProfiles::Update.result(attributes: user_profile_params, id: profile.id)

    respond_to do |format|
      if result.success?
        format.html { redirect_to user_path(username: profile.username), notice: t(".notice") }
      else
        format.html do
          render Profiles::EditPage.new(user: current_user), status: :unprocessable_entity
        end
      end
    end
  end

  private

  def user_profile_params
    params.require(:user_profile).permit(:avatar, :display_name, :bio).to_h
  end

  def profile
    @profile ||= current_user.profile
  end
end
