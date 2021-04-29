class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :find_task, except: [:index, :new, :create]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)

    redirect_to @task, notice: 'Created Successfully'
  end

  def update
    @task.update(task_params)

    redirect_to @task, notice: 'Updated Successfully'
  end

  def destroy
    @task.destroy!

    redirect_to :root, notice: "Deleted Successfully."
  end

  private

  def task_params
    params.required(:task).permit(:description, :project_id)
  end

  def find_task
    @task = Task.find(params[:id])
  end

end

