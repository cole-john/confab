class Reply < ApplicationRecord
  belongs_to :author, class_name: "User", counter_cache: true
  belongs_to :post
  belongs_to :repliable, polymorphic: true


  
end
