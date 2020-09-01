class MessagesController < ApplicationController
  def create 
    @user = User.find(params[:user_id]) 
    @message = @user.messages.new 
    if @message.update(message_params) 
      redirect_to room_path(@user)
  end  
end  
  def destroy 
      @user = User.find(params[:user_id]) 
      @message = @user.messages.find(params[:id]) 
      @message.delete 
      redirect_to room_path(@user)
  end 
  private 
  def message_params  
    params.require(:message).permit(:text).merge(user_id: current_user.id)
  end  
end 