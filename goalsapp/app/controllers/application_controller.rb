class ApplicationController < ActionController::Base
  
  helper_method :current_user, :logged_in?

  def login_user!(user)
    session[:session_token] = user.reset_session_token!
  end

  def logged_out
    current_user.reset_session_token! if logged_in?
    session[:session_token] = nil
    current_user = nil
  end

  def current_user
    @user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    !!current_user
  end

  def require_logged_in
    redirect_to new_session_url unless logged_in?
  end

  def require_logged_out
    redirect_to new_session_url if logged_in?
  end
end
