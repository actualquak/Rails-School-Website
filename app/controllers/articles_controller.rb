class ArticlesController < ApplicationController
  before_action :must_be_admin, only: [ :edit, :destroy, :new, :create, :update ]
  def index
  end
  def latest
    redirect_to "/articles"
  end
  def show
    @article = Article.find(params[:id])
  end
  def new
    @article = Article.new
  end
  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end
  def edit
    @article = Article.find(params[:id])
  end
  def destroy
    @article = Article.find(params[:id])
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
    def must_be_admin
      unless current_user && current_user.try(:admin?)
        redirect_to root_path, notice: "HEY DON'T DO THAT"
      end
    end
end
