module ApplicationHelper
  def current_user
    session[:user_id] && User.find(session[:user_id])
  end
end
