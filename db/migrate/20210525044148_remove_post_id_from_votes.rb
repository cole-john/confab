# frozen_string_literal: true

class RemovePostIdFromVotes < ActiveRecord::Migration[6.1]
  def change
    remove_column :votes, :post_id
    remove_column :votes, :fan_id_id
  end
end
