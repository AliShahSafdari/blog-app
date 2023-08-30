require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before(:each) do
    @user = User.create(name: 'Alishah', photo: 'https://placehold.co/200x133', bio: 'Teacher from US.',
                        post_counter: 0)
    @post = @user.posts.create(title: 'Hello', text: 'This is my first post.', comment_counter: 0, like_counter: 0)
  end
  context 'GET /index' do
    it 'returns http success' do
      get "/users/#{@user.id}/posts"
      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
    end

    it 'render the index template' do
      get "/users/#{@user.id}/posts/"
      expect(response).to render_template('posts/index')
    end

    it 'includes the correct placeholder text' do
      get "/users/#{@user.id}/posts/"
      expect(response.body).to include('Number of posts:')
    end
  end

  context 'GET /show' do
    it 'returns http success' do
      get "/users/#{@user.id}/posts/#{@post.id}/"
      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
    end

    it 'render the show template' do
      get "/users/#{@user.id}/posts/#{@post.id}/"
      expect(response).to render_template('posts/show')
    end

    it 'includes the correct placeholder text' do
      get "/users/#{@user.id}/posts/#{@post.id}/"
      expect(response.body).to include('Comments:')
    end
  end
end
