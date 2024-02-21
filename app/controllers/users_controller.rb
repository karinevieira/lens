# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show]

  def show
    user = UserProfile.find_by(username: params[:username]).user

    render Users::ShowPage.new(user: user)
  end
end
