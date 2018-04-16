module Amp
  class ArticlesController < ApplicationController
    def show
      year, month, day = params.values_at(:year, :month, :day).map(&:to_i)
      slug = params[:slug]

      @article = Article.published.where(published_on: Date.new(year, month, day), slug: slug).first
    end
  end
end
