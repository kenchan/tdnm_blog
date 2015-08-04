class ArticlesController < ApplicationController
  layout 'application'

  def index
    @articles = Article.limit(10)
  end
end
