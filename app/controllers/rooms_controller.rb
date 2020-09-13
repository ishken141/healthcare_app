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
    if @room.save
    flash[:success] = "作成しました！"
    redirect_to user_rooms_path(@user) 
    else  
    flash[:info] = "相談室名を入力してください！"
    render :new
    end
  end 

  def show  
    @user = User.find(params[:user_id]) 
    @room = Room.find(params[:id]) 
    @messages = @room.messages.includes(:user)
    @message = Message.new 
    @like = Like.new
  end  

  def destroy 
    @room = Room.find(params[:id])
    @room.destroy
    flash[:danger] = "削除しました!" 
    redirect_to rooms_path
  end 

  def search  
    @rooms = Room.search(params[:keyword])
  end 

  private 
  def room_params 
    params.require(:room).permit(:box, :image, :user_id).merge(user_id: current_user.id)
  end 
end 