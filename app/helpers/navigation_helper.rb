module NavigationHelper
  def set_articles
    @articles = Article.all
  end
end
