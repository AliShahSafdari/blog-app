class Comment < ApplicationRecord
    belongs_to :post
    belongs_to :author, class_name: 'User'


    after_save :update_post_comment_counter

    private

    def update_post_comment_counter
        post.increment!(:comment_counter)
    end
end