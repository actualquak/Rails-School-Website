class CommentsController < ApplicationController
  def index
  end
  def new
    @comment = Comment.new(parent_id: params[:parent_id])
  end
  def create
    if params[:comment][:parent_id].to_i > 0
      parent = Comment.find_by_id(params[:comment].delete(:parent_id))
      @comment = parent.children.build(comment_params)
      @comment.article_id = parent.article_id
    else
      @comment = Comment.new(comment_params)
    end

    if @comment.save
      flash[:success] = 'Your comment was successfully added!'
      redirect_to root_path
    else
      render 'new'
    end
  end
  def edit
    @comment = Comment.find(params[:id])
  end
  def update
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end
  def destroy
    @comment = Comment.find(params[:id])

    if @comment.destroy
      redirect_to root_path
    end
  end
  private

    def comment_params
      params.require(:comment).permit(:content)
    end
end
