require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'AliShah', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'I am student in Microverse Modul 5 first week', post_counter: 0) }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'bio should be present' do
    subject.bio = nil
    expect(subject).to_not be_valid
  end

  it 'photo should be  present' do
    expect(subject).to be_valid
  end

  it 'post_counter must be integer' do
    subject.post_counter = 'two'
    expect(subject).to_not be_valid
  end

  it 'post_counter must be 4' do
    subject.post_counter = 4
    expect(subject.post_counter).to eq(4)
  end
end
