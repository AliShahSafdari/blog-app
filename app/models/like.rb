class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :update_post_like_counter
  after_destroy :update_post_like_counter_decrement

  private

  def update_post_like_counter
    post.increment!(:like_counter)
  end
  def update_post_like_counter_decrement
    post.decrement!(:like_counter) if post.present?
  end
end
