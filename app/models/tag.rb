class Tag < ApplicationRecord

    has_many :tag_joins, dependent: :destroy

end
