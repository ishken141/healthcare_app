class StoresController < ApplicationController 
  def edit 
    @store = Store.find(params[:id]) 
    @user = User.find(params[:user_id])
  end 
  def update 
    @store = Store.find(params[:id]) 
    @user = User.find(params[:user_id]) 
    if @store.update(store_params)
      redirect_to root_path 
  end   
end 
  def show 
    @room = Room.find(params[:id]) 
    @user = User.find(params[:user_id])
    @store = @user.store 
  end 
  private 
  def store_params 
    params[:store].permit(:name, :tell, :address, :schedule, :profile_id, :user_id).merge(user_id: current_user.id)
end 
end
