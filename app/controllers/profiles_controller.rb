class ProfilesController < ApplicationController
  def edit 
    @profile = Profile.find(params[:id]) 
    @user = User.find(params[:user_id])
  end
end
