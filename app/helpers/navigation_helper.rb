module NavigationHelper
  def set_articles
    @articles = Article.search_for('Ruby on Rails')
    @first_5_articles = Article.all.order("created_at DESC").first(5)
  end
end
