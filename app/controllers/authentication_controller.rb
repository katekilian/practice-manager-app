class AuthenticationController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "You're now logged in! WOO!"
      redirect_to tasks_path
    else
      flash[:error] = "Oops, your username or password is not in our database. Please try again."
      render :new
    end
  end

  def destroy
    session.clear
    flash[:notice] = "You're now logged out. See ya next time!"
    redirect_to root_path
  end

end
