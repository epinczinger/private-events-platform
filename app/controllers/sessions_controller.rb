class SessionsController < ApplicationController

  skip_before_action :authorized, only: [:new, :create, :welcome]

  
  def new; end

  def create
    @user = User.find_by(name: params[:name])

    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/welcome'
    else
      flash.now[:danger] = 'There was something wrong with the login information'
      redirect_to '/login'
    end
  end

  def login; end

  def welcome; end

  def page_requires_login; end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'You have successfully logged out'
    redirect_to root_path
  end
end
