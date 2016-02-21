class CommentsController < ApplicationController
  load_and_authorize_resource param_method: :safe_params

  def index
    @comments = Task.find(params[:task_id]).comments
    render json: @comments
  end

  def create

    @comment = Comment.new()
    @comment.description = params[:description]
    @comment.task_id = params[:task_id]
    @comment.avatars = { images: ["020300200303020300303"]}
    @comment.save
    render json: @comment
  end

  def destroy
    @comment.destroy
    render json: :ok
  end

  private

  def safe_params
    params.require(:comment).permit(:description, :task_id)
  end
end





#     "comment"=>{
#         "description"=>"q",
#         "task_id"=>"321",
#         "avatars"=>[
#             {"lastModifiedDate"=>"2016-01-02T08:23:35.946Z", "size"=>22401, "type"=>"image/jpeg", "name"=>"1.jpg"}
#     ]}
# }
