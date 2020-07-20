class LikesController < ApplicationController
  def create
    @like = Like.new(user_id: current_user.id, post_id: params[:post_id])
    if @like.save
      redirect_to "/posts/#{params[:post_id]}"
    else 
      redirect_to root_path
    end   
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
    if @like.destroy
      redirect_to "/posts/#{params[:post_id]}"
    else
      redirect_to root_path
    end  
  end
end
