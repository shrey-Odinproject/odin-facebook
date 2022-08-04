class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def create_request
    # current_user.send_request(User.find(params[:id])) unable to use instance method
    Request.create(friend_id: params[:id], user_id: current_user.id)
    flash[:success] = 'Request sent!'
    redirect_to root_path
  end

  def accept_request
    @request = Request.where(friend_id: current_user.id, user_id: params[:requestor_id])[0]
    @request.accepted = true
    if @request.save
      flash[:success] = 'Friendship Accepted!'
      redirect_to root_path
    else
      flash.now[:error] = 'Could not be friends!'
      render :show, status: :unprocessable_entity
    end
  end
end
