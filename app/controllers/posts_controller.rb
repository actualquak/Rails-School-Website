class PostsController < ApplicationController
  before_action :redirect_if_not_signed_in, only: [:new, :create, :edit, :update]
  def show
    @post = Post.find(params[:id])
  end
  def new
    @post = Post.new
  end
  def create
    @post = Post.new(post_params)
    user = current_user
    @post.user_id = user.id
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end
  def edit
    @post = Post.find(params[:id])
  end
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :new
    end
  end
  private
    def post_params
      params.require(:post).permit(:title, :content)
    end
    def redirect_if_not_signed_in
      redirect_back fallback_location: "/" if !user_signed_in?
    end
end
