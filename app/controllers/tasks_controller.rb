class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update, :destroy]

  def index
    @tasks = current_user.tasks
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.new(task_params)

    if @task.save
      redirect_to root_path, notice: 'Created success!'
    else
      redirect_to new_task_path, alert: "Fields can't be blank!"
    end
  end

  def edit
  end

  def update
    @task.update(task_params)
    redirect_to root_path
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
end
