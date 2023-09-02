class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User'
  validates :text, presence: true, length: { in: 3..100 }

  after_save :update_post_comment_counter
  after_destroy :update_user_comment_counter_decrement

  private

  def update_post_comment_counter
    post.increment!(:comment_counter)
  end
  
  def update_user_comment_counter_decrement
    post.decrement!(:comment_counter) if post.present?
  end
end
