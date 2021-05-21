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
  has_many :votes, dependent: :destroy
  has_many :follows, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :tags, class_name: 'TagJoin', dependent: :destroy
end
