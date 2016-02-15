class ProjectsController < ApplicationController
  load_and_authorize_resource param_method: :safe_params

  def index
    render json: current_user.projects
  end

  def create
    @project = current_user.projects.create(safe_params)
    render json: @project
  end

  def show
    render json: @project
  end

  def update
    @project.update(safe_params)
    render json: :ok
  end

  def destroy
    @project.destroy
    render json: :ok
  end

  private

  def safe_params
    params.require(:project).permit(:title)
  end
end
