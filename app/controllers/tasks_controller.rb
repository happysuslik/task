class TasksController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_task, only: [:show, :update, :destroy]

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
    @task.update_attributes(safe_params)
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

  def set_task
    @task = current_user.tasks.find(params[:id])
  end


end
