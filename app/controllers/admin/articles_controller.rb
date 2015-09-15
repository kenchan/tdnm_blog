class Admin::ArticlesController < ApplicationController
  before_action :require_login

  def new
    @article = Article.new
  end

  def create
    @article = Article.create!(article_param)
    redirect_to admin_dashboard_path
  end

  private
  def article_param
    params.require(:article).permit(:title, :body, :url_title, :published_on)
  end
end
