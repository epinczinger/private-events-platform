class UsersController < ActionController::Base

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
        @user = User.find_by_id(params[:id])
        unless @user
          flash[:error] = "User not found"
        end
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
