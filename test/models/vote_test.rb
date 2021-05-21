# frozen_string_literal: true

# == Schema Information
#
# Table name: votes
#
#  id              :bigint           not null, primary key
#  favorites_count :integer          default(0)
#  vote_status     :integer
#  votes_count     :integer          default(0)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  fan_id_id       :bigint           not null
#  post_id         :bigint           not null
#
# Indexes
#
#  index_votes_on_fan_id_id  (fan_id_id)
#  index_votes_on_post_id    (post_id)
#
# Foreign Keys
#
#  fk_rails_...  (fan_id_id => users.id)
#  fk_rails_...  (post_id => posts.id)
#
require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
