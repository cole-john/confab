class Vote < ApplicationRecord
  belongs_to :post, counter_cache: true
  belongs_to :fan_id, class_name: "Users", counter_cache: true
  belongs_to :reply, foreign_key: "post_id", counter_cache: true
  
  enum vote_status: { down: 0, up: 1, star: 2 }

end
