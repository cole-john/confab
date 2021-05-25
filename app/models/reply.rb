# frozen_string_literal: true

# == Schema Information
#
# Table name: replies
#
#  id             :bigint           not null, primary key
#  body           :text
#  repliable_type :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  author_id      :bigint           not null
#  repliable_id   :bigint           not null
#
# Indexes
#
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

  has_many :votes, foreign_key: 'post_id', dependent: :destroy
  has_many :replies, as: :repliable
end
