class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id]) # can use post_id as routing for likes controller is nested
    if already_liked?
      flash[:error] = 'U have already liked this post!'
    else
      @post.likes.create(user_id: current_user.id)
    end
    redirect_to post_path(@post) # why is this not within if-else?
    # maybe cannot render the same page again after an error?, no using flash.now
  end

  def destroy
    @like = Like.where(user_id: current_user.id, likeable_id: params[:post_id])[0]
    @post = Post.find(params[:post_id])
    if !already_liked?
      flash[:error] = "Can't unlike!"
    else
      @like.destroy
    end
    redirect_to post_path(@post)
  end

  private

  def already_liked?
    Like.where(user_id: current_user.id, likeable_id: params[:post_id]).exists?
  end
  # the 2 post ids are for 1) column in likes table, 2) present in params dut to nested routes
end
