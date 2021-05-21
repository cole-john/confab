# frozen_string_literal: true

# == Schema Information
#
# Table name: tags
#
#  id              :bigint           not null, primary key
#  name            :string
#  tag_joins_count :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'test_helper'

class TagTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
