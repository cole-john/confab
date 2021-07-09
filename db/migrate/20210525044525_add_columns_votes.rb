# frozen_string_literal: true

class AddColumnsVotes < ActiveRecord::Migration[6.1]
  def change
    add_reference :votes, :votable, polymorphic: true, null: false, index: true
    add_reference :votes, :user, foreign_key: true, null: false, index: true
  end
end
