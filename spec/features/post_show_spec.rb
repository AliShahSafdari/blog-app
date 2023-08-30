require 'rails_helper'

RSpec.feature 'Post Index', type: :feature do
  before(:each) do
    @user = User.create(name: 'Ali', photo: 'https://placehold.co/200x133', bio: 'He is good programmer',
                        post_counter: 0)
    @post1 = @user.posts.create(title: 'Post 1', text: 'This is the first post.', comment_counter: 0, like_counter: 0)
    Comment.create(post: @post1, author: @user, text: 'This is a comment')
    Like.create(post: @post1, author: @user)
  end

  describe 'User index page' do
    before(:each) { visit user_post_path(@user, @post1) }

    it "I can see the post's title." do
      expect(page).to have_content('Post 1')
    end

    it 'I can see who wrote the post' do
      expect(page).to have_content('Post "#" by Ali')
    end

    it 'I can see how many comments and likes it has.' do
      expect(page).to have_content('Comments: 1,')
      expect(page).to have_content('Likes: 1')
    end

    it 'I can see the post body' do
      expect(page).to have_content('This is the first post.')
    end

    it 'I can see the username of each commentor and the comment each commentor left.' do
      expect(page).to have_content('Ali: This is a comment')
    end
  end
end
