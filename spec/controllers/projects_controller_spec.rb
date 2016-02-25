require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  let(:project) { create :project }

  before do
    sign_in project.user
  end

  describe '#index' do
    it 'is a success' do
      get :index
      expect(response.status).to eq(200)
    end

    it 'returns user projects' do
      get :index
      expect(response.body).to eq("[#{project.to_json}]")
    end
  end

  describe '#show' do
    before do
      get :show, id: project.id
    end
    it 'is a success' do
      expect(response.status).to eq(200)
    end

    it 'renders project as json' do
      expect(response.body).to eq(project.to_json)
    end
  end

  describe '#create' do
    before do
      post :create, project: { title: 'project' }
    end

    it 'responds to POST' do
      expect(response.status).to eq(200)
    end

    it 'create project' do
      expect(Project.find_by(title: 'project')).to_not be_nil
    end
  end

  describe '#update' do
    it 'responds to PATCH' do
      patch :update, id: project.id, project: { title: "Project 1" }
      expect(response.status).to eq(200)
      expect(project.reload.title).to eq("Project 1")
    end
  end

  describe '#destroy' do
    it 'responds to DELETE' do
      delete :destroy, id: project.id
      expect(response.status).to eq(200)
      expect(Project.find_by(id: project.id)).to be_nil
    end
  end

end
