class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]

  def new
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
    if @user.email_confirmed
      sign_in(@user)
      redirect_to root_path
    else
      flash.now[:error] = 'Please activate your account by following the
        instructions in the account confirmation email you received to proceed'
      render 'new'
    end
    else
      flash.now[:error] = 'Invalid email/password combination' # Not quite right!
      render :new
    end
  end

  def welcome
  end

  def page_requires_login
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
