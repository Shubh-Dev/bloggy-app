require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /posts' do
    it 'works! (now write some real specs)' do
      get posts_path
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get posts_path
      expect(response).to render_template(:index)
    end

    it 'returns the status :ok' do
      get posts_path
      expect(response).to have_http_status(:ok)
    end

    it 'includes correct text' do
        get posts_path
        expect(response.body).to include('posts will load Here')
        end
  end

  describe 'GET /show' do
    it 'renders the show template' do
      get post_path(1)
      expect(response).to render_template(:show)
    end

    it 'returns a :ok status code' do
      get post_path(1)
      expect(response).to have_http_status(:ok)
    end

    it 'includes correct text' do
        get post_path(1)
        expect(response.body).to include('Details of User\'s post')
        end
  end
end
