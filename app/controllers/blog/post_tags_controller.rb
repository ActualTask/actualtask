class Blog::PostTagsController < Blog::ApplicationController
  def show
    @post_tag = PostTag.find_by(name: params[:id])
    @posts = @post_tag.posts
  end
end