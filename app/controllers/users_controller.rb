class UsersController < ApplicationController
  def show
    @user = User.find(params[:id]) if params[:id]
  end

  def index
    @users = User.all
  end
end
