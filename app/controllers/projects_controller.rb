class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_project, except: [:index, :new, :create]

  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.create(project_params)

    redirect_to @project, notice: 'Created Successfully'
  end

  def update
    @project.update(project_params)

    redirect_to @project, notice: 'Updated Successfully'
  end

  def destroy
    @project.destroy!

    redirect_to :root, notice: "Deleted Successfully."
  end

  private

  def project_params
    params.required(:project).permit(:name, :customer_id)
  end

  def find_project
    @project = Project.find(params[:id])
  end

end