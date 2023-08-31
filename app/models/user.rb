class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable  
  # Associations
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'
  
  # Attributes and Validations
  validates :name, presence: true, length: { in: 3..25 }
  # validates :photo, presence: true
  # validates :bio, presence: true, length: { in: 10..255 }
  validates :post_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # Methods
  def recent_posts(limit = 3)
    posts.order(created_at: :desc).limit(limit)
  end
end
