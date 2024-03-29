# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id              :bigint           not null, primary key
#  body            :text
#  favorites_count :integer          default(0)
#  follows_count   :integer          default(0)
#  replies_count   :integer          default(0)
#  tags_count      :integer          default(0)
#  title           :string
#  votes_count     :integer          default(0)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  author_id       :bigint           not null
#
# Indexes
#
#  index_posts_on_author_id  (author_id)
#
# Foreign Keys
#
#  fk_rails_...  (author_id => users.id)
#
class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', counter_cache: true

  has_many :replies, as: :repliable, dependent: :destroy
  has_many :votes, as: :votable, dependent: :destroy
  has_many :follows, dependent: :destroy
  has_many :favorites, as: :favoritable, dependent: :destroy
  has_many :tag_joins, dependent: :destroy
  has_many :tags, through: :tag_joins, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true

  scope :by_replies, -> { order(replies_count: :desc) }
  scope :by_favorites, -> { order(favorites_count: :desc) }
  scope :by_votes, -> { order(votes_count: :desc) }
end
