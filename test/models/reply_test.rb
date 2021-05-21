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
#  post_id        :bigint           not null
#  repliable_id   :bigint           not null
#
# Indexes
#
#  index_replies_on_author_id  (author_id)
#  index_replies_on_post_id    (post_id)
#  index_replies_on_repliable  (repliable_type,repliable_id)
#
# Foreign Keys
#
#  fk_rails_...  (author_id => users.id)
#  fk_rails_...  (post_id => posts.id)
#
require 'test_helper'

class ReplyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
