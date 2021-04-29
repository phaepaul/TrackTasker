class TaskLogsController < ApplicationController
  before_action :authenticate_user!

  def new
    @task_log = TaskLog.new
  end

  def create
    @task_log = TaskLog.create(task_log_params)

    redirect_to tasks_path, notice: 'Time logged Successfully'
  end

  private

  def task_log_params
    params.required(:task_log).permit(:duration_minutes, :project_id, :user_id)
  end

end