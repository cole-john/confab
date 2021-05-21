# frozen_string_literal: true

class CreateReplies < ActiveRecord::Migration[6.1]
  def change
    create_table :replies do |t|
      t.references :author, null: false, foreign_key: { to_table: :users }, index: true
      t.references :post, null: false, foreign_key: true, index: true
      t.text :body
      t.references :repliable, null: false, polymorphic: true, index: true

      t.timestamps
    end
  end
end
