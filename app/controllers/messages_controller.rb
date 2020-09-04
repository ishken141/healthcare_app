class MessagesController < ApplicationController
  def create  
    # @user = User.find(params[:user_id]) 
    @room = Room.find(params[:room_id])
    @message = Message.create(message_params) 
    respond_to do |format| 
        format.html { redirect_to room_path(@room)} 
        format.json 
      # redirect_to room_path(@user)
    end  
end 
  def destroy 
      # @user = User.find(params[:user_id])  
      @room = Room.find(params[:room_id])
      @message = @room.messages.find(params[:id]) 
      @message.delete 
      redirect_to room_path(@room)
  end 
  private 
  def message_params  
    params.require(:message).permit(:text, :room_id, :user_id, :profile_id).merge(user_id: current_user.id, room_id: params[:room_id])
  end  
end 