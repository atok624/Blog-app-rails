require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe 'GET #index' do
    it 'returns http success and renders the index template' do
      get url_for(controller: 'users', action: 'index'), params: { id: 1 }
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
      # expect(response.body).to include('Here is a list of users')
    end
  end

  describe 'GET #show' do
    let(:post) { FactoryBot.create(:post) }
    let(:user) { FactoryBot.create(:user, posts: [post]) }

    it 'returns http success and renders the show template' do
      get user_path(user)
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
    end
  end
end
