class MessagesController < ApplicationController 
  before_action :set_room, only: %i[ create, destroy]
  def create  
    @message = Message.create(message_params) 
    respond_to do |format| 
        format.html { redirect_to room_path(@room)} 
        format.json 
    end  
  end 

  def destroy   
      @message = @room.messages.find(params[:id]) 
      @message.delete 
      redirect_to rooms_path
  end 

  def set_room 
    @room = Room.find(params[:room_id])
  end 
  
  private 
  def message_params  
    params.require(:message).permit(:text, :room_id, :user_id, :profile_id).merge(user_id: current_user.id, room_id: params[:room_id])
  end  
end 