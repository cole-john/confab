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
require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
