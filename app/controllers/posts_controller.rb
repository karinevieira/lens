# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authorize_action!, only: %i[edit update destroy]

  def index
    result = Posts::List.result

    respond_to do |format|
      format.html { render Posts::IndexPage.new(posts: result.posts) }
    end
  end

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

  def edit
    respond_to do |format|
      format.html { render Posts::EditPage.new(post: post) }
    end
  end

  def update
    result = Posts::Update.result(attributes: post_params, id: params[:id])

    respond_to do |format|
      if result.success?
        format.html { redirect_to root_path }
      else
        format.html do
          render Posts::EditPage.new(post: result.post), status: :unprocessable_entity
        end
      end
    end
  end

  def destroy
    result = Posts::Destroy.result(id: params[:id])

    respond_to do |format|
      if result.success?
        format.html { redirect_to root_path }
      else
        format.html { redirect_to root_path, status: :unprocessable_entity }
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:image, :subtitle).merge(user_id: current_user.id).to_h
  end

  def authorize_action!
    authorize! post, with: PostPolicy
  end

  def post
    @post ||= Posts::Find.result(id: params[:id]).post
  end
end
