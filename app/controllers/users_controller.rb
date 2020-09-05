class UsersController < ApplicationController
  def index  
    @user = User.all 
  end  
  def new 
    @room = Room.new 
  end 
  def show
    # @name = @user.name  
    @user = User.find(params[:id]) 
    @profile = Profile.find_by(user_id: @user.id)
  end 
  def followers
    @user = User.find(params[:id])
    @users = @user.followers
  end
  def followings
    @user = User.find(params[:id])
    @users = @user.followings
  end
end
