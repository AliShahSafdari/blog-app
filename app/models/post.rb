class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments

  validates :title, presence: true, length: { in: 3..250 }
  validates :text, presence: true, length: { in: 3..100 }
  validates :comment_counter, :like_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :update_user_post_counter

  def recent_comments(limit = 5)
    comments.order(created_at: :desc).limit(limit)
  end

  private

  def update_user_post_counter
    author.increment!(:post_counter)
  end
end
