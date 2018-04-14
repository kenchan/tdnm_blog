module Amp
  class ArticlesController < ApplicationController
    def show
      year, month, day, title = params.values_at(:year, :month, :day).map(&:to_i)
      url_title = params[:title]

      @article = Article.published.where(published_on: Date.new(year, month, day), url_title: url_title).first
    end
  end
end