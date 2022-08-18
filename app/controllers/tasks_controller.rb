class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to root_path
  end

  def edit
  end

  def update
    @task.update(task_params)
    redirect_to root_path
  end

  def complete
    @tasks = Task.where(done: true)
  end

  def destroy
    @task.destroy
    redirect_to root_path
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :done)
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def complete_incomplete
    if @task.done == true
      redirect_to complete_tasks_path
    end

    if @task.done == false
      redirect_to root_path
    end
  end
end
