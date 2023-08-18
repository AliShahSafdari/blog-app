require 'rails_helper'

RSpec.describe Like, type: :model do
  subject = User.new(name: 'AliSirat', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                     bio: 'I am student in Microverse Modul 5 first week')
  first_post = Post.new(author: subject, title: 'Hello', text: 'This is my first post', comment_counter: 0,
                        like_counter: 0)
  first_like = Like.new(post: first_post, author: subject)

  it 'like should be valid' do
    expect(first_like).to be_valid
  end
end
