# frozen_string_literal: true

class PostsController < ApplicationController
  def new
    respond_to do |format|
      format.html { render Posts::NewPage.new(post: Post.new) }
    end
  end

  def create
    result = Posts::Create.result(attributes: post_params)

    respond_to do |format|
      if result.success?
        format.html { redirect_to root_path }
      else
        format.html do
          render Posts::NewPage.new(post: result.post), status: :unprocessable_entity
        end
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:image, :subtitle).to_h
  end
end
