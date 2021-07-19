class ArticleCommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    if user_signed_in?
      @article_comment = ArticleComment.new
      @article_comment.user_id = current_user.id
      @article_comment.article_id = @article.id
      @article_comment.content = params[:article_comment][:content]
      if @article_comment.save
        redirect_to @article
      else
        redirect_to @article
      end
    else
      redirect_to "/new-profile"
    end
  end
  private
    def comment_params
      params.require(:article_comment).permit(:content)
    end
end
