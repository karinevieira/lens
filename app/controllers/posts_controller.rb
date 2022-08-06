# frozen_string_literal: true

class PostsController < ApplicationController
  def new
    render Posts::NewPage.new
  end
end
