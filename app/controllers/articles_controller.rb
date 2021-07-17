class ArticlesController < ApplicationController
  @articles = Article.all
  def index
    @articles = Article.all
  end
end
