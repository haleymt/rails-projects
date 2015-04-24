class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def login!(user)
    self.session[:session_token] = user.reset_token!
  end

  def logout
    self.session[:session_token] = nil
    redirect_to new_session_url
  end

  def logged_in?
    !!current_user
  end

  def current_user
    return nil if self.session[:session_token].nil?
    current_user = User.find_by_session_token(self.session[:session_token])
  end
end
