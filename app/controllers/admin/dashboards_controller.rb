class Admin::DashboardsController < ApplicationController
  before_action :require_login

  def show
    @articles = Article.order('id desc').page(params[:page])
  end
end
