class ArticlesController < ApplicationController
  layout 'application'

  def index
    @articles = Article.published.order(published_on: :desc).page(params[:page]).per(params[:per_page] || 5)
  end

  def list
    y, m, d = *params.permit(:year, :month, :day).values_at(:year, :month, :day)
    @articles = Article.published.archives(y, m, d).order(published_on: :desc).page(params[:page])
    render :index
  end

  def show
    year, month, day = params.values_at(:year, :month, :day).map(&:to_i)
    slug = params[:slug]

    @article = Article.published.where(published_on: Date.new(year, month, day), slug: slug).first!
  end
end
