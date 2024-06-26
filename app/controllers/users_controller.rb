# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show]

  def show
    result = Users::FindByUsername.result(username: params[:username])

    render Users::ShowPage.new(current_user: current_user, user: result.user)
  end
end
