class RoomsController < ApplicationController
  def index
    @users = User.all 
  end 
  def destroy 
  end 
  def show  
    @user = User.find(params[:id]) 
    @message = Message.new 
  end 
end
