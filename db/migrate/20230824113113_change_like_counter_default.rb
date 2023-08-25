class ChangeLikeCounterDefault < ActiveRecord::Migration[7.0]
  def change
    change_column :posts, :like_counter, :integer, default: 0
  end
end
