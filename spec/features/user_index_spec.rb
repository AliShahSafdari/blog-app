require 'rails_helper'

RSpec.feature 'User Index', type: :feature do
  before(:each) do
    @user = User.create(name: 'Ali', photo: 'https://placehold.co/200x133', bio: 'He is good programmer',
                        post_counter: 0)
    @user1 = User.create(name: 'Salim', photo: 'https://placehold.co/200x133', bio: 'He is good programmer',
                         post_counter: 0)
    @user.posts.create(title: 'Post 1', text: 'This is the first post.', comment_counter: 0, like_counter: 0)
    @user.posts.create(title: 'Post 2', text: 'This is the second post.', comment_counter: 0, like_counter: 0)
    @user.posts.create(title: 'Post 3', text: 'This is the third post.', comment_counter: 0, like_counter: 0)
  end

  describe 'User index page' do
    before(:each) { visit users_path }

    it 'displays  a container and the username of each user' do
      expect(page).to have_css('div.container')
      expect(page).to have_content('Ali')
      expect(page).to have_content('Salim')
    end

    it 'displays the photos of each user' do
      expect(page.has_xpath?("//img[@src='https://placehold.co/200x133']"))
    end

    it 'shows the number of posts of each user' do
      expect(page).to have_content('Number of posts: 3')
      expect(page).to have_content('Number of posts: 0')
    end

    it "is redirected to that user's show page" do
      click_link('Ali')
      visit user_path(@user)
      expect(page).to have_current_path(user_path(@user))
    end
  end
end
