class RoomsController < ApplicationController
  def index
    @users = User.all.order('created_at DESC') 
    @rooms = Room.includes(:user)
  end 
  def new 
    @user = User.find(params[:user_id]) 
    @room = Room.new 
  end  
  def create  
    @user = User.find(params[:user_id]) 
    @room = Room.create(room_params) 
    redirect_to user_rooms_path(@user) 
  end 
  def show  
    @user = User.find(params[:user_id]) 
    @room = Room.find(params[:id]) 
    @messages = @room.messages.includes(:user)
    @message = Message.new 
  end  
  def destroy 
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to root_path
  end 
  def search  
    @search = Room.search(params[:keyword])
  end 
  private 
  def room_params 
    params.require(:room).permit(:box, :image, :user_id).merge(user_id: current_user.id)
end 
end 
