class CommentsController < ApplicationController
  load_and_authorize_resource param_method: :safe_params

  def index
    @comments = Task.find(params[:task_id]).comments
    render json: @comments
  end

  def create
    @comment = Comment.create(safe_params)
    render json: @comment
  end

  def destroy
    @comment.destroy
    render json: :ok
  end

  private

  def safe_params
    params.require(:comment).permit(:description, :task_id, :avatar)
  end
end
