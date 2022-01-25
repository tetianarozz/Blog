class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.create(params.require(:user).permit(:first_name, :second_name, :email, :password))
    session[:user_id] = @user.id
    redirect_to '/welcome'
  end
end
