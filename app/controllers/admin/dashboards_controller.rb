class Admin::DashboardsController < ApplicationController
  before_action :require_login

  def show
    @articles = Article.order(published_on: :desc).page(params[:page])
  end
end
