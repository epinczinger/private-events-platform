class EventsController < ActionController::Base
  def index
    @past = Event.past
    @upcoming = Event.upcoming
  end

  def new
    @event = current_user.created_events.build
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      flash[:notice] = 'The event was created succesfully'
      redirect_to users_path
    else
      flash[:alert] = 'Something went grong, try again'
      render 'new'
    end
  end

  def current_user
    session[:user_id] && User.find(session[:user_id])
  end

  def show
    @events = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:event_name, :event_location, :event_date, :event_description)
  end
end
