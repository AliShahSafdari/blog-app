class Post < ApplicationRecord
    belongs_to :author, class_name: 'User'
    has_many :likes
    has_many :comments

    after_save :update_user_post_counter

    def recent_comments(limit = 5)
        comments.order(created_at: :desc).limit(limit)
    end

    private

    def update_user_post_counter
        author.increment!(:post_counter)
    end
end