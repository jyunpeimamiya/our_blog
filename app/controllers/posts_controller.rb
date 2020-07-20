class PostsController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :search]

  def index
    @posts = Post.includes(:user)
    @post = Post.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def show
    @post = Post.find(params[:id])
    @like = Like.new
    @likes_count = Like.where(post_id: @post.id).count
    
  end

  def search
    @posts = Post.search(params[:keyword]).page(params[:page]).per(5).order(created_at: 'desc')
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path(post.id)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :content).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
