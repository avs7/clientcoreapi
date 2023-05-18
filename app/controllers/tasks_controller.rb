class TasksController < ApplicationController
  before_action :ensure_authorized!
  def index
    @tasks = current_user.tasks
  end

  def show
    @task = current_user.tasks.find(params[:id])
  end


  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
    else
      render @task.errors
    end
  end

  def edit
    @task = current_user.tasks.find(params[:id])
  end

  def update
    @task = current_user.tasks.find(params[:id])
    if @task.update(task_params)
    else
      render @task.errors
    end
  end

  def destroy
    @task = current_user.tasks.find(params[:id])
    @task.destroy
  end

  private
  def task_params
    params.require(:task).permit(:title, :details, :status, :priority, :due_date)
  end
end