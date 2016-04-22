class Api::V1::ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :update, :destroy]

  respond_to :json

  def index
    respond_with :api, :v1, Article.all
  end

  def show
    respond_with :api, :v1, @article
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      respond_with :api, :v1, @article
    end
  end

  def update
    @article.update_attributes(article_params)
    respond_with :api, :v1, @article
  end

  def destroy
    @article.destroy
    respond_with :api, :v1, @article
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(
                                    :title,
                                    :url,
                                    :archive,
                                    :tag_list
                                   )
  end
end
