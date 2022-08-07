class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      flash[:success] = 'Comment created'
    else
      flash[:error] = 'error'
    end
    redirect_to post_path(params[:post_id])
  end

  def destroy
    @post = Post.find(params[:post_id]) # can use current_user instead of finding @post
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(params[:post_id]), status: :see_other
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
