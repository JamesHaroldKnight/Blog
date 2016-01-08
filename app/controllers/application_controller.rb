class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  helper_method :current_user, :logged_in?

  def current_user
    #Return this user if session ID then find the user in the database based upon that ID so that we have the entire user object i.e username etc.
    @current_user || User.find(session[:user_id]) if session[:user_id]
  end

  # The !! converts a statement into a boolean.  It will return true if i have a current user
  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to root_path
    end
  end


end
