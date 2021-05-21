# frozen_string_literal: true

class RemovePostTypefromPosts < ActiveRecord::Migration[6.1]
  def change; end

  def up
    remove_column :posts, :post_type
  end
end
