module NavigationHelper
  def set_articles
    @articles = Article.all.order("created_at DESC")
    @first_5_articles = Article.all.order("created_at DESC").first(5)
  end
end
