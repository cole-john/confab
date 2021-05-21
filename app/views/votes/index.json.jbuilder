# frozen_string_literal: true

json.array! @votes, partial: 'votes/vote', as: :vote
