class SessionsController < ApplicationController

  def new

  end


  # Move the user to a logged in state.  The downcase is bceasue all emails are downcase in the database.
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "You have successfully logged in"
      redirect_to user_path(user)
    else
      flash.now[:danger] = "There was something wrong with your login details"
      render "new"
    end
  end


  # Move the user to a logged out state.
  def destroy
    session[:user_id] = nil
    flash[:success] = "You have logged out"
    redirect_to root_path
  end


end