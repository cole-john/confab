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
require 'test_helper'

class ReplyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
