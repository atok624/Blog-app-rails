require 'rails_helper'

RSpec.describe PostsController, type: :request do
  describe 'GET #index' do
    let(:user) { FactoryBot.create(:user) }

    before do
      FactoryBot.create_list(:post, 3, author: user)
    end

    it 'returns http success and renders the index template' do
      get user_posts_path(user)
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
      # expect(response.body).to include('Here is a list of posts and comments for a given user')
    end
  end

  describe 'GET #show' do
    let(:user) { FactoryBot.create(:user) }
    let(:post) { FactoryBot.create(:post, author: user) }

    before do
      FactoryBot.create_list(:comment, 3, post:)
    end

    it 'returns http success and renders the show template' do
      get user_post_path(user, post)
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
      # expect(response.body).to include('Here is a post and its list of comments')
    end
  end
end
