class ArticlesController < ApplicationController
  layout 'application'

  def index
    @articles = Article.published.order(published_on: :desc).page(params[:page])
  end

  def list
    y, m, d = *params.permit(:year, :month, :day).values_at(:year, :month, :day)
    @articles = Article.published.archives(y, m, d).order(published_on: :desc).page(params[:page])
    render :index
  end

  def show
    year, month, day, title = params.values_at(:year, :month, :day).map(&:to_i)
    url_title = params[:title]

    @article = Article.published.where(published_on: Date.new(year, month, day), url_title: url_title).first
  end
end
