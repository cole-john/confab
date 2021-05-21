class RemovePostTypeFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :post_type, :integer
  end
end
