class UsersController < ActionController::Base

    # before_action :require_login

    def new
        @user = User.new
    end

    def create
        @user = User.create(params.require(:user).permit(:name, :email,        
        :password))
        session[:user_id] = @user.id
        redirect_to '/welcome'
    end

    def show
        @user = User.find(params[:id])
    end

    private

    def require_login
      # do stuff to check if user is logged in
    end


end
