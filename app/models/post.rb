class Post < ApplicationRecord
  belongs_to :author, class_name: "User", counter_cache: true

  has_many :replies, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :follows, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :tags, class_name: "TagJoin", dependent: :destroy


end
