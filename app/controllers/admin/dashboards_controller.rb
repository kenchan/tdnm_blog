class Admin::DashboardsController < ApplicationController
  layout 'admin'
  before_action :require_login

  def show
    @articles = Article.order(published_on: :desc).page(params[:page])
  end
end
