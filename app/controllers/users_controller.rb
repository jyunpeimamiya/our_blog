class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @posts = @user.posts.page(params[:page]).per(5).order("created_at DESC")
  end
end