class UsersController < ApplicationController
  def index  
    @user = User.all 
  end 
  def show
    @name = current_user.name  
    @user = User.find(params[:id]) 
    @profile = Profile.find_by(user_id: @user.id)
  end
end
