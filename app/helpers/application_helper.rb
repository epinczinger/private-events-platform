module ApplicationHelper
  def current_event_creator
    User.find(@events.event_creator_id).name
  end

  def current_user
    session[:user_id] && User.find(session[:user_id])
  end

  def navbar_log_buttons
    links = ''
    if logged_in?
      links << link_to('My Profile', user_path(session[:user_id]))
      links << '  ' + link_to('Sign out', logout_path, method: :delete)
    else
      links << link_to('Log in', login_path, method: :get)
      links << '  ' + link_to('Sign up', new_user_path)
    end
    links.html_safe
  end
end
