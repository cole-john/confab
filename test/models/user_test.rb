# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  avatar_img             :string
#  bio                    :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  favorites_count        :integer          default(0)
#  follows_count          :integer          default(0)
#  posts_count            :integer          default(0)
#  remember_created_at    :datetime
#  replies_count          :integer          default(0)
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  username               :citext
#  votes_count            :integer          default(0)
#  website                :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_username              (username) UNIQUE
#
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
