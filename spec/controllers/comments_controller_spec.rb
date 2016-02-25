require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:user)    { create(:user) }
  let(:project) { create :project }
  let(:task)    { create(:task) }
  let(:comment) { create(:comment) }

  before do
    sign_in user
  end

  describe '#index' do
    it 'is a success' do
      get :index, project_id: project.id, task_id: comment.task.id
      expect(response.status).to eq(200)
    end

    it 'return comment of task' do
      get :index, project_id: project.id, task_id: comment.task.id
      expect(response.body).to eq("[#{comment.to_json}]")
    end
  end

  describe '#create' do
    before do
      post :create, project_id: project.id, task_id: comment.task.id, comment: { description: "test", task_id: task.id, avatar: "" }
    end

    it 'responce to POST' do
      expect(response.status).to eq(200)
    end

    it 'create comment' do
      expect(Comment.find_by(description: "test")).to_not be_nil
    end
  end

  describe '#destroy' do
    it 'response to DELETE' do
      delete :destroy, project_id: project.id, task_id: comment.task.id, id: comment.id
      expect(response.status).to eq(200)
      expect(Comment.find_by(id: comment.id)).to be_nil
    end
  end

end
