class CommentsController < ApplicationController
  before_action :find_commentable
  def new
    @comment = Comments.new
  end
  def create
    @comment = @commentable.comments.new comment_params
    @comment.User = current_user
    if user_signed_in?
      if @comment.save
        redirect_back fallback_location: "/"
      else
        redirect_back fallback_location: "/"
        flash[:warning] = "Something went wrong!"
      end
    else
      redirect_back fallback_location: "/"
      flash[:warning] = "Log in first!"
    end
  end
  def edit
    @comment = @commentable.comments.find(params[:id])
  end
  def update
    @comment = @commentable.comments.find(params[:id])

    if @comment.update(comment_params)
      redirect_back fallback_location: "/"
    else
      redirect_back fallback_location: "/"
      flash[:warning] = "Something went wrong"
    end
  end
  def destroy
    @comment = @commentable.comments.find(params[:id])

    if @comment.destroy
      redirect_back fallback_location: "/"
    else
      redirect_back fallback_location: "/"
      flash[:warning] = "Something went wrong"
    end
  end
  private
    def comment_params
      params.require(:comment).permit(:body)
    end
    def find_commentable
      @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
      @commentable = Article.find_by_id(params[:article_id]) if params[:article_id]
    end
end
