class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
  end

  def create
    @profile = current_user.build_profile(profile_params)
    
    if @profile.save
      flash[:success] = 'Profile created'
      redirect_to current_user
    else
      flash.now[:error] = 'Error!'
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      flash[:success] = 'profile edited'
      redirect_to current_user
    else
      flash.now[:error] = 'Error!'
      render :new, status: :unprocessable_entity
    end
  end

  private
  
  def profile_params
    params.require(:profile).permit(:gender, :age)
  end
end
