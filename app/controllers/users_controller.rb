class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id # створюєм нову пару ключ-значення в сесії
      UserMailer.with(user: @user).registration_confirmation.deliver_later
      flash[:success] = "Please confirm your email address to continue"
      redirect_to root_path  # перекидає на іншу сторінку
    else
      flash[:error] = "Ooooppss, something went wrong!"
      render :new   # ще раз передивиться запрос new
    end
  end

  def confirm_email
    @user = User.find_by_confirm_token(params[:id])
    if @user
      @user.email_activate
      flash[:success] = "Welcome! Your email has been confirmed.
      Please sign in to continue."
      redirect_to login_path
    else
      flash[:error] = "Sorry. User does not exist"
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :second_name, :email, :password)  # permit фільтрує параметри які можна оновлювати
  end
end
