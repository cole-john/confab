# frozen_string_literal: true

class RemovePostTypefromPost < ActiveRecord::Migration[6.1]
  def change; end

  def up
    remove_column :post, :post_type
  end
end
