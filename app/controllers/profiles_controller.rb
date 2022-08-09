class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
    @gender_options = ['male', 'female'].map {|g| [g, g] }
  end
end
