class ProjectsController < ApplicationController
    before_action :authenticate_user!
    before_action :find_project, only: %i[ show destroy update ]

    def index
      @projects = Projects.all
    end

    def show
    end

    def update
      @project.update(permitted_params)
    end

    def destroy
      @project.destroy!

      head :no_content
    end

    private

    def permitted_params
      params.permit(:id)
    end

    def find_project
      @project = Project.find(params[:id])
    end

end