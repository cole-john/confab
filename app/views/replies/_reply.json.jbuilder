# frozen_string_literal: true

json.extract! reply, :id, :author_id, :post_id, :body, :repliable_id, :created_at, :updated_at
json.url reply_url(reply, format: :json)
