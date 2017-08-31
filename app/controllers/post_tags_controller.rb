class PostTagsController < ApplicationController
  def show
    @post_tags = PostTag.find_by(name: params[:id])
    @posts = @post_tags.posts
  end
end