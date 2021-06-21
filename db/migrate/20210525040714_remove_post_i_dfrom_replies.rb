# frozen_string_literal: true

class RemovePostIDfromReplies < ActiveRecord::Migration[6.1]
  def change
    remove_column :replies, :post_id
  end
end
