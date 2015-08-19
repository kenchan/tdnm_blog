class ArticlesController < ApplicationController
  layout 'application'

  def index
    @articles = Article.order('id desc').page(params[:page])
  end

  def show
    year, month, day, title = params.values_at(:year, :month, :day).map(&:to_i)
    url_title = params[:title]

    @article = Article.where(published_on: Date.new(year, month, day), url_title: url_title).first
  end
end
