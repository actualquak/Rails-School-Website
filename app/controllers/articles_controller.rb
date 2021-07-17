class ArticlesController < ApplicationController
  @articles = Article.all
  def index
    @articles = Article.all
  end
  def show
    @articles = Article.all
    @article = Article.find(params[:id])
  end
  def new
    @articles = Article.all
    @article = Article.new
  end
  def create
    @article = Article.new(title: "...", content: "...")

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end
  def edit
    @articles = Article.all
    @article = Article.find(params[:id])
  end
  def destroy
    @article = Article.find(params[:id])
    puts @article
    @article.destroy

    redirect_to root_path
  end
  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end
  private
    def article_params
      params.require(:article).permit(:title, :content)
    end
end
