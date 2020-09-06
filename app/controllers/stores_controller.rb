class StoresController < ApplicationController 
  def edit 
    @store = Store.find(params[:id]) 
    @user = User.find(params[:user_id])
  end 
  def update 
    @store = Store.find(params[:id]) 
    @user = User.find(params[:user_id]) 
    if @store.update(store_params)
      redirect_to user_store_path(@user, @store) 
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
