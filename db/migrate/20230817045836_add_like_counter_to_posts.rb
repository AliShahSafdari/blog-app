class AddLikeCounterToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :like_counter, :integer
  end
end
