class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id]) # can use post_id as routing for likes controller is nested
    if already_liked?
      flash[:error] = 'U have already liked this post!'
      # render post_path(@post), status: :unprocessable_entity
    else
      @post.likes.create(user_id: current_user.id)
    end
    redirect_to post_path(@post) # why is this not within if-else?
  end

  private

  def already_liked?
    Like.where(user_id: current_user.id, post_id: params[:post_id]).exists?
  end
  # the 2 post ids are for 1) column in likes table, 2) present in params dut to nested routes
end
