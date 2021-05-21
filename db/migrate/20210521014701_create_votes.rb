# frozen_string_literal: true

class CreateVotes < ActiveRecord::Migration[6.1]
  def change
    create_table :votes do |t|
      t.references :post, null: false, foreign_key: true, index: true
      t.references :fan_id, null: false, foreign_key: { to_table: :users }, index: true
      t.integer :vote_status
      t.integer :votes_count, default: 0
      t.integer :favorites_count, default: 0

      t.timestamps
    end
  end
end
