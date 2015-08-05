class ArticlesController < ApplicationController
  layout 'application'

  def index
    @articles = Article.order('id desc').limit(10)
  end
end
