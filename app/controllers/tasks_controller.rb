class TasksController < ApplicationController

  def today
  end

  def index
    @tasks = Task.where(user_id: @current_user.id)
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params.merge(user_id: @current_user.id))
    if @task.save
      flash[:notice] = "New practice assignment created successfully!"
      redirect_to tasks_path
    else
      render :new
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :category_id, :task_date_id)
  end

end
