require 'rails_helper'

RSpec.describe ClientViewsController, type: :controller do

  describe '#show' do
    it 'is a success' do
      get :show, id: 'tasks'
      expect(response.status).to eq(200)
    end

    it 'renders tasks template' do
      get :show, id: 'tasks'
      expect(response).to render_template('tasks')
    end
  end

end
