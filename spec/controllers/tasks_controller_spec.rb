require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  let(:user)    { create :user }
  let(:project) { create :project }
  let(:task)    { create :task }

  before do
    sign_in user
  end

  describe '#index' do
    it 'is a success' do
      get :index, project_id: project.id
      expect(response.status).to eq(200)
    end
  end

  describe '#show' do
    before do
      get :show, project_id: project.id, id: task.id
    end
    it 'is a success' do
      expect(response.status).to eq(200)
    end

    it 'renders task as json' do
      expect(response.body).to eq(task.to_json)
    end
  end

  describe '#create' do
    before do
      post :create, project_id: project.id, task: { text: 'ert', completed: false, priority: 1, project_id: project.id }
    end

    it 'responds to POST' do
      expect(response.status).to eq(200)
    end

    it 'create task' do
      expect(Task.find_by(text: 'ert', completed: false)).to_not be_nil
    end
  end

  describe '#update' do
    it 'responds to PATCH' do
      patch :update, project_id: project.id, id: task.id, task: { text: "123", completed: true }
      expect(response.status).to eq(200)
      expect(task.reload.text).to eq("123")
      expect(task.reload.completed).to eq(true)
    end
  end

  describe '#destroy' do
    it 'responds to DELETE' do
      delete :destroy, project_id: project.id, id: task.id
      expect(response.status).to eq(200)
      expect(Task.find_by(id: task.id)).to be_nil
    end
  end


end
