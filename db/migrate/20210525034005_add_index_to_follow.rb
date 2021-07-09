# frozen_string_literal: true

class AddIndexToFollow < ActiveRecord::Migration[6.1]
  def change
    add_index :follows, %i[user_id post_id], unique: true
  end
end
