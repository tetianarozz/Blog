class ApplicationController < ActionController::Base
  before_action :authorized

  helper_method :current_user
  helper_method :logged_in?

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user.present?
  end

  def authorized
    redirect_to "/welcome" unless logged_in?
  end

  def sign_in(user)
    session[:user_id] = user.id
  end

  def sign_out
    session.delete :user_id # видалить запис хешу по ключу
  end

  def admin?
    current_user.admin?
  end


end
