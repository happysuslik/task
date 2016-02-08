require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  let(:task) { create :task }

  before do
    sign_in task.user
  end

  describe '#index' do
    it 'is a success' do
      get :index
      expect(response.status).to eq(200)
    end

    it 'returns a task is user' do
      get :index
      expect(response.body).to eq("[#{task.to_json}]")
    end
  end

  describe '#show' do
    it 'is a success' do
      get :show, id: task.id
      expect(response.status).to eq(200)
      expect(response.body).to eq(task.to_json)
    end
  end

  describe '#create' do
    it 'responds to POST' do
      post :create, task: { text: task.text, completed: task.completed }
      expect(response.status).to eq(200)
    end
  end

  describe '#update' do
    it 'responds to PATCH' do
      patch :update, id: task.id, task: { text: "123", completed: true }
      expect(response.status).to eq(200)
      expect(task.reload.text).to eq("123")
      expect(task.reload.completed).to eq(true)
    end
  end

  describe '#destroy' do
    it 'responds to DELETE' do
      delete :destroy, id: task.id
      expect(response.status).to eq(200)
      expect(Task.find_by(id: task.id)).to be_nil
    end
  end


end
