class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User'
  validates :text, presence: true, length: { in: 3..100 }

  after_save :update_post_comment_counter

  private

  def update_post_comment_counter
    post.increment!(:comment_counter)
  end
end
