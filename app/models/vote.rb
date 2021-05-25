# frozen_string_literal: true

# == Schema Information
#
# Table name: votes
#
#  id              :bigint           not null, primary key
#  favorites_count :integer          default(0)
#  votable_type    :string           not null
#  vote_status     :integer
#  votes_count     :integer          default(0)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :bigint           not null
#  votable_id      :bigint           not null
#
# Indexes
#
#  index_votes_on_user_id  (user_id)
#  index_votes_on_votable  (votable_type,votable_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Vote < ApplicationRecord
  belongs_to :post, counter_cache: true
  belongs_to :fan_id, class_name: 'Users', counter_cache: true
  belongs_to :reply, foreign_key: 'post_id', counter_cache: true

  enum vote_status: { down: 0, up: 1, star: 2 }
end
