class Vote < ApplicationRecord
  belongs_to :post
  belongs_to :fan_id, class_name: "Users"
  
  enum vote_status: { down: 0, up: 1, star: 2 }

end
