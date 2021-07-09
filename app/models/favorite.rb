# frozen_string_literal: true

# == Schema Information
#
# Table name: favorites
#
#  id               :bigint           not null, primary key
#  favoritable_type :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  favoritable_id   :bigint           not null
#  user_id          :bigint           not null
#
# Indexes
#
#  index_favorites_on_favoritable  (favoritable_type,favoritable_id)
#  index_favorites_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Favorite < ApplicationRecord
  belongs_to :user, counter_cache: true
  belongs_to :favoritable, polymorphic: true

  validates :user, uniqueness: { scope: %i[favoritable_type favoritable_id] }
end
