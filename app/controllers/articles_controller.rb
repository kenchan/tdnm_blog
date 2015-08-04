class ArticlesController < ApplicationController
  layout 'application'

  def index
    @articles = Article.all
  end
end
