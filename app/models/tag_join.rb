# frozen_string_literal: true

class TagJoin < ApplicationRecord
  belongs_to :post, counter_cache: :tags_count
  belongs_to :tag, counter_cache: true
end
