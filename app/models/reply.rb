class Reply < ApplicationRecord
  belongs_to :author, class_name: "User"
  belongs_to :post
  belongs_to :repliable, polymorphic: true


  
end
