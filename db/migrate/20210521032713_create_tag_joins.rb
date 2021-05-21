# frozen_string_literal: true

class CreateTagJoins < ActiveRecord::Migration[6.1]
  def change
    create_table :tag_joins do |t|
      t.references :post, null: false, foreign_key: true, index: true
      t.references :tag, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
