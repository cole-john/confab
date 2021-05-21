# frozen_string_literal: true

class Tag < ApplicationRecord
  has_many :tag_joins, dependent: :destroy
end
