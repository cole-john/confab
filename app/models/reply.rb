# frozen_string_literal: true

# == Schema Information
#
# Table name: replies
#
#  id             :bigint           not null, primary key
#  ancestry       :string
#  body           :text
#  repliable_type :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  author_id      :bigint           not null
#  repliable_id   :bigint           not null
#
# Indexes
#
#  index_replies_on_ancestry   (ancestry)
#  index_replies_on_author_id  (author_id)
#  index_replies_on_repliable  (repliable_type,repliable_id)
#
# Foreign Keys
#
#  fk_rails_...  (author_id => users.id)
#
class Reply < ApplicationRecord
  belongs_to :author, class_name: 'User', counter_cache: true
  belongs_to :repliable, polymorphic: true

  has_ancestry

  has_many :votes, as: :votable, dependent: :destroy
  has_many :replies, as: :repliable, dependent: :destroy
  has_many :favorites, as: :favoritable, dependent: :destroy

  scope :by_replies, -> { order(replies_count: :desc) }
  scope :by_favorites, -> { order(favorites_count: :desc) }
  scope :by_votes, -> { order(votes_count: :desc) }
end
