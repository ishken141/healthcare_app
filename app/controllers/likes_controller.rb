class LikesController < ApplicationController 
  def create 
    @user = User.find(params[:user_id]) 
    @room = Room.find(params[:room_id])
    @like = current_user.likes.create(room_id: params[:room_id]) 
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end  

  def destroy 
    @user = User.find(params[:user_id]) 
    @room = Room.find(params[:room_id])
    @like = Like.find_by(room_id: params[:room_id], user_id: current_user.id) 
    @like.destroy  
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end   
end