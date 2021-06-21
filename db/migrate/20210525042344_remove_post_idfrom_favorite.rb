# frozen_string_literal: true

class RemovePostIdfromFavorite < ActiveRecord::Migration[6.1]
  def change
    remove_column :favorites, :post_id
  end
end
