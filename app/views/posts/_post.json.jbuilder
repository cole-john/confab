# frozen_string_literal: true

json.extract! post, :id, :title, :body, :post_type, :author_id, :replies_count, :votes_count, :favorites_count,
              :follows_count, :tags_count, :created_at, :updated_at
json.url post_url(post, format: :json)
