class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = 'Post created'
      redirect_to post_path(params[:id])
    else
      flash.now[:error] = 'Error!'
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = 'Post edited'
      redirect_to post_path(params[:id])
    else
      flash.now[:error] = 'Error!'
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
    @post_author = User.find(@post.user_id)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = 'Post deleted'
    redirect_to user_path(current_user.id), status: :see_other
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
