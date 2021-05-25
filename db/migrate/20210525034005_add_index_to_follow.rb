class AddIndexToFollow < ActiveRecord::Migration[6.1]
  def change
    add_index :follows, [:user_id, :post_id], unique: true
  end
end
