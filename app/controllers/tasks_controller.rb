class TasksController < ApplicationController
  before_action :ensure_authorized!
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
    else
      render @task.errors
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
    else
      render @task.errors
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
  end

  private
  def task_params
    params.require(:task).permit(:title, :details, :status, :priority, :due_date)
  end
end