module ArticleCommentsHelper
  def set_article_comments(article:)
    @article_comments = ArticleComment.where(article_id: article)
  end
end
