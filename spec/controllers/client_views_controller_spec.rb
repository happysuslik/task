require 'rails_helper'

RSpec.describe ClientViewsController, type: :controller do

  describe '#show' do
    it 'is a success' do
      get :show, id: 'tasks'
      expect(response.status).to eq(302)
    end
  end

end
