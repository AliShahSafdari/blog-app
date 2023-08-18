require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject = User.new(name: 'AliSirat', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                     bio: 'I am student in Microverse Modul 5 first week')
  first_post = Post.new(author: subject, title: 'Hello', text: 'This is my first post', comment_counter: 0,
                        like_counter: 0)
  first_comment = Comment.new(post: first_post, author: subject, text: 'Hi Tom!')
  it 'comment should be valid' do
    expect(first_comment).to be_valid
  end

  it 'text should be present' do
    first_comment.text = nil
    expect(first_comment).to_not be_valid
  end

  it 'text should not be too short' do
    first_comment.text = 'a'
    expect(first_comment).to_not be_valid
  end

  it 'text should not be too long ' do
    first_comment.text = 'a' * 200
    expect(first_comment).to_not be_valid
  end
end
