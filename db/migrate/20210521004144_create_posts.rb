class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.integer :post_type
      t.references :author, null: false, foreign_key: {to_table: :users}, index: true
      t.integer :replies_count, default: 0
      t.integer :votes_count, default: 0
      t.integer :favorites_count, default: 0
      t.integer :follows_count, default: 0
      t.integer :tags_count, default: 0

      t.timestamps
    end
  end
end
