class TasksController < ApplicationController
  load_and_authorize_resource param_method: :safe_params

  def index
    render json: current_user.tasks
  end

  def show
    render json: @task
  end

  def create
    @task = current_user.tasks.create(safe_params)
    render json: @task
  end

  def update
    @task.update(safe_params)
    render json: :ok
  end

  def destroy
    @task.destroy
    render json: :ok
  end

  private

  def safe_params
    params.require(:task).permit(:text, :completed)
  end

end
