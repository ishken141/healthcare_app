class RoomsController < ApplicationController
  def index
    @users = User.all 
    @rooms = Room.all
  end 
  def new 
    @room = Room.new 
  end  
  def create 
    @room = Room.create(room_params) 
    redirect_to root_path 
  end 
  def show  
    @user = User.find(params[:id]) 
    @room = Room.find(params[:id]) 
    @messages = @room.messages.includes(:user)
    @message = Message.new 
  end  
  def destroy 
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to root_path
  end 
  private 
  def room_params 
    params.require(:room).permit(:box, :image, :user_id, :profile_id, :store_id).merge(user_id: current_user.id)
end 
end 
