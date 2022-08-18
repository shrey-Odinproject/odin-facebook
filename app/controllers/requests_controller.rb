class RequestsController < ApplicationController

  def create
    Request.create(friend_id: params[:friend_id], user_id: current_user.id)
    flash[:success] = 'Request sent!'
    redirect_to root_path
  end

  def update
    # acceptin a request is updating the already existing record
    @request = Request.find(params[:request_id])
    @request.update(accepted: true)
    flash[:success] = 'Friendship Accepted!'
    redirect_to current_user
  end

  def destroy
    @request = Request.find(params[:request_id])
    @request.destroy
    flash[:success] = 'Friendship Declined!'
    redirect_to current_user
  end
end
