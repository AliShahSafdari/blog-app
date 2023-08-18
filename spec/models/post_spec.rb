require 'rails_helper'

RSpec.describe Post, type: :model do
  subject = User.new(name: 'AliSirat', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                     bio: 'I am student in Microverse Modul 5 first week')
  first_post = Post.new(author: subject, title: 'Hello', text: 'This is my first post', comment_counter: 0,
                        like_counter: 0)

  it 'post should be valid' do
    expect(first_post).to be_valid
  end

  it 'text should be present' do
    first_post.text = nil
    expect(first_post).to_not be_valid
  end

  it 'title should not be too short' do
    first_post.title = 'a'
    expect(first_post).to_not be_valid
  end

  it 'comment_counter must be integer' do
    first_post.comment_counter = 'two'
    expect(first_post).to_not be_valid
  end

  it 'like_counter must be 4' do
    first_post.like_counter = 4
    expect(first_post.like_counter).to eq(4)
  end
end
