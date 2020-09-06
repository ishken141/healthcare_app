class StoresController < ApplicationController 
  def new 
    @store = Store.new 
    @user = User.find(params[:user_id])
  end 
  def create 
    @user = User.find(params[:user_id])
    @store = Store.create 
    if @store.update(store_params) 
      redirect_to root_path
  end  
end  
def destroy 
  @user = User.find(params[:user_id])
  @store = Store.find(params[:id])
  if @store.destroy 
    redirect_to root_path 
  end 
end 
  def show 
    @user = User.find(params[:user_id])
    @room = Room.find(params[:id]) 
    @store = @user.store 
  end 
  private 
  def store_params 
    params[:store].permit(:image, :name, :tell, :address, :schedule, :profile_id, :user_id).merge(user_id: current_user.id)
end 
end
