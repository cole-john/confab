class Favorite < ApplicationRecord
  belongs_to :post, counter_cache: true
  belongs_to :user, counter_cache: true

  
end
