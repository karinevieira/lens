# frozen_string_literal: true

class LikesController < ApplicationController
  def create
    result = Posts::Like.result(post_id: params[:post_id], user_id: current_user.id)
    redirect_to post_path(result.post) if result.success?
  end

  def destroy
    result = Posts::Dislike.result(post_id: params[:post_id], user_id: current_user.id)
    redirect_to posts_path if result.success?
  end
end
