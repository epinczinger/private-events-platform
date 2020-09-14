class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :logged_in?
  before_action :authorized

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def require_user
    return if logged_in?

    flash[:danger] = 'You need to be logged in to perform that action'
    redirect_to root_path
  end

  def authorized
    redirect_to '/welcome' unless logged_in?
  end
end
