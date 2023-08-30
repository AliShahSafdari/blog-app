require 'rails_helper'

RSpec.feature 'Post Index', type: :feature do
  before(:each) do
    @user = User.create(name: 'Ali', photo: 'https://placehold.co/200x133', bio: 'He is good programmer',
                        post_counter: 0)
    @post1 = @user.posts.create(title: 'Post 1', text: 'This is the first post.', comment_counter: 0, like_counter: 0)
    @post2 = @user.posts.create(title: 'Post 2', text: 'This is the second post.', comment_counter: 0, like_counter: 0)
    Comment.create(post: @post1, author: @user, text: 'This is a comment')
    Like.create(post: @post1, author: @user)
  end

  describe 'User index page' do
    before(:each) { visit user_posts_path(@user) }

    it 'displays  the user photo, name, and the number of posts the user has written  ' do
      expect(page.has_xpath?("//img[@src='https://placehold.co/200x133']"))
      expect(page).to have_content('Ali')
      expect(page).to have_content('Number of posts: 2')
    end

    it "Displays a post's title and the post's body." do
      expect(page).to have_content('Post 1')
      expect(page).to have_content('This is the second post.')
    end

    it 'Display the first comments on a post, how many comments and likes a post has, and pagination the page' do
      expect(page).to have_content('This is a comment')
      expect(page).to have_content('Comments: 1,')
      expect(page).to have_content('Likes: 1')
      expect(page).to have_content('1')
    end

    it "clicking on a post, it redirects me to that post's show page" do
      click_link 'Post 1'
      expect(page).to have_current_path(user_post_path(@user, @post1))
    end
  end
end
