class RoomsController < ApplicationController
  def index
    @users = User.all 
    @rooms = Room.all
  end 
  def new 
    @room = Room.new 
  end 
  def show  
    @room = Room.find(params[:id])
    @messages = @room.messages.includes(:user)
    @message = Message.new 
  end 
end
