class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id #створюєм нову пару ключ-значення в сесії
      redirect_to root_path  # перекидає на іншу сторінку
    else
      render :new   # ще раз передивиться запрос new
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :second_name, :email, :password)  #permit фільтрує параметри які можна оновлювати
  end
end
