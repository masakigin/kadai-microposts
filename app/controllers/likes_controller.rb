class LikesController < ApplicationController
  before_action :require_user_logged_in
  
  def index
    @user = User.find(params[:id])
    @microposts_liked = @user.microposts_liked.page(params[:page])
    counts(@user)
  end

  
  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.favorite(micropost)
    flash[:success] = 'お気に入りしました。'
    redirect_to user_path(current_user)
      
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.unfavorite(micropost)    
    flash[:success] = 'お気に入りを解除しました。'
    redirect_to user_path(current_user)
  end 
end
  
