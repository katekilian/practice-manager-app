class RegistrationsController < ApplicationController

  skip_before_action :require_login

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Yay, you signed up!"
      redirect_to tasks_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
