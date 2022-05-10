class SessionsController < ApplicationController
  def new
  end

  def create
    reset_session

    session[:user_id] = request.env['omniauth.auth']['uid']

    redirect_to '/avo'
  end
end
