# frozen_string_literal: true

# == Schema Information
#
# Table name: tag_joins
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :bigint           not null
#  tag_id     :bigint           not null
#
# Indexes
#
#  index_tag_joins_on_post_id  (post_id)
#  index_tag_joins_on_tag_id   (tag_id)
#
# Foreign Keys
#
#  fk_rails_...  (post_id => posts.id)
#  fk_rails_...  (tag_id => tags.id)
#
class TagJoin < ApplicationRecord
  belongs_to :post, counter_cache: :tags_count
  belongs_to :tag, counter_cache: true
end
