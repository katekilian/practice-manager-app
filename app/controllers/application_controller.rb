class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :todays_tasks
  before_action :require_login
  before_action :user_cats

  helper_method :current_user

  def todays_tasks
    if current_user
      @todays_tasks = Task.all.where(task_date_id: TaskDate.find_by(date: Date.today.beginning_of_day).id)
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def require_login
    unless current_user
      session[:previous_url] = request.url
      flash[:error] = "You must sign in"
      redirect_to sign_in_path # halts request cycle
    end
  end

  def user_cats
    if current_user
      @user_cats = Category.where(user_id: [@current_user.id, nil])
    end
  end


end
