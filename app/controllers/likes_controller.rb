
class LikesController < ApplicationController 
  def create  
    @user = User.find(params[:user_id])
    @like = current_user.likes.create(user_id: params[:user_id]) 
    respond_to do |format|
      format.html { redirect_to room_path(@user) }
      format.js
    end
  end  

  def destroy  
    @user = User.find(params[:user_id])
    @like = Like.find_by(user_id: params[:user_id], user_id: current_user.id) 
    @like.destroy  
    respond_to do |format|
      format.html { redirect_to room_path(@user) }
      format.js
    end
  end  
end