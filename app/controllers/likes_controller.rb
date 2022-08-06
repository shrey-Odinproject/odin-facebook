class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id]) # can use post_id as routing for likes controller is nested
    @post.likes.create(user_id: current_user.id)
    redirect_to post_path(@post)
  end
end
