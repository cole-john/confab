# frozen_string_literal: true

# == Schema Information
#
# Table name: follows
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_follows_on_post_id              (post_id)
#  index_follows_on_user_id              (user_id)
#  index_follows_on_user_id_and_post_id  (user_id,post_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (post_id => posts.id)
#  fk_rails_...  (user_id => users.id)
#
require 'test_helper'

class FollowTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
