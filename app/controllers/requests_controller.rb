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
    if params[:request_id] # determines from which view the delete request is coming from
      @request = Request.find(params[:request_id])
      @request.destroy
      flash[:success] = 'Friendship Declined!'
    else
      @request = Request.find_accepted_request(params[:user_id], params[:friend_id])
      @request.destroy
      flash[:success] = 'Unfriended!'
    end

    redirect_to current_user
  end
end
