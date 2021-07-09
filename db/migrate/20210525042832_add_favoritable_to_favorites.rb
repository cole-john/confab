# frozen_string_literal: true

class AddFavoritableToFavorites < ActiveRecord::Migration[6.1]
  def change
    add_reference :favorites, :favoritable, polymorphic: true, null: false, index: true
  end
end
