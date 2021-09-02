class ArticlesController < ApplicationController
  layout 'application'

  def index
    @articles = Article.published.order(published_on: :desc).page(params[:page]).per(params[:per_page] || 12)
  end

  def show
    if params[:year]
      year, month, day = params.values_at(:year, :month, :day).map(&:to_i)
      slug = params[:slug]
      @article = Article.published.where(published_on: Date.new(year, month, day), slug: slug).first!

      redirect_to article_path(title: @article.title), status: 301
      return
    end

    @article = Article.published.where(title: params[:title]).first!
  end
end
