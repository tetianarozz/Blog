class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(first_name: params[:first_name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/welcome'
    else
      redirect_to '/login'
    end
  end

  def login
  end

  def welcome
  end
end
