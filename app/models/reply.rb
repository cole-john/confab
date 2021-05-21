# frozen_string_literal: true

class Reply < ApplicationRecord
  belongs_to :author, class_name: 'User', counter_cache: true
  belongs_to :post, counter_cache: true
  belongs_to :repliable, polymorphic: true

  has_many :votes, foreign_key: 'post_id', dependent: :destroy
end
