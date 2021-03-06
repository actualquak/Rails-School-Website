class CommentsController < ApplicationController
  def new
    if user_signed_in?
      @comment = Comment.new(parent_id: params[:parent_id])
    else
      redirect_to new_user_registration_path
    end
  end
  def create
    if user_signed_in?
      if params[:comment][:parent_id].to_i > 0
        parent = Comment.find_by_id(params[:comment].delete(:parent_id))
        Comment.find_by_id(params[:comment].delete(:article_id))
        @comment = parent.children.build(comment_params)
        @comment.article_id = parent.article_id
      else
        @comment = Comment.new(comment_params)
      end
      user = current_user
      @comment.user_id = user.id
      if @comment.save
        flash[:success] = 'Your comment was successfully added!'
        redirect_to params[:comment][:return_url]
      else
        render 'new'
      end
    else
      redirect_to new_user_registration_path
    end
  end
  def edit
    if user_signed_in?
      @comment = Comment.find(params[:id])
    else
      redirect_to new_user_registration_path
    end
  end
  def update
    @comment = Comment.find(params[:id])
    user = current_user
    if user.id == @comment.user_id or user.admin
      if @comment.update(edit_comment_params)
        redirect_to params[:comment][:return_url]
      else
        render 'edit'
      end
    end
  end
  def destroy
    @comment = Comment.find(params[:id])
    user = current_user
    if user.id == @comment.user_id or user.admin
      if @comment.destroy
        redirect_to params[:comment][:return_url]
      end
    end
  end
  private
    def comment_params
      params.require(:comment).permit(:content, :article_id)
    end
    def edit_comment_params
      params.require(:comment).permit(:content)
    end
end
