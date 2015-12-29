class ArticlesController < ApplicationController

  before_action :set_article, only: [:edit,:update,:show,:destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end


  def edit
  end


  def create
   @article = Article.new(article_params)
    if @article.save
      flash[:success] = "Article was created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end



  def update
    if @article.update(article_params)
      flash[:sucess] = "Article was updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end



  def show
  end

  #Method to delete Articles

  def destroy
    @article.destroy
    flash[:danger] = "Article was deleted"
    redirect_to articles_path
  end


  private
  def article_params
    params.require(:article).permit(:title, :description)
  end

  # Creating a method for this as it repeats a lot

  def set_article
        @article = Article.find(params[:id])
  end


  end
