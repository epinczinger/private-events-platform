class UsersController < ApplicationController
  skip_before_action :authorized, only: %i[new create]

  def new
    @user = User.new
    redirect_to user_path(current_user) if logged_in?
  end

  def create
    @user = User.create(params.require(:user).permit(:name, :email,
                                                     :password))
    session[:user_id] = @user.id
    redirect_to '/welcome'
  end

  def show
    @user = User.find_by_id(params[:id])
    @upcoming_events = @user.attended_events.upcoming
    @prev_events = @user.attended_events.past
    flash[:error] = 'User not found' unless @user
  end

  def index
    @users = User.all
    @events = Event.all
  end

  private

  def require_login
    # do stuff to check if user is logged in
  end
end
