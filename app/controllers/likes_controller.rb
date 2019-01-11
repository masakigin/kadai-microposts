class LikesController < ApplicationController
  before_action :require_user_logged_in
  
  def index
    @user = current_user
    @likes = Like.where(user_id: @user.id).all
  end

  
  def create
    @user_id = current_user.id
    @micropost_id = Micropost.find(params[:id]).id
    @like = Like.new(micropost_id: @micropost_id, user_id: @user_id)
      if @like.save
        flash[:success] = 'お気に入りしました。'
        redirect_to user_path(current_user)
      end   
  end

  def destroy
    @like = Like.find(params[:id])
    if @like.destroy
      flash[:success] = 'お気に入りを解除しました。'
      redirect_to user_path(current_user)
    end
  end 
  
  
  
 
end
  
