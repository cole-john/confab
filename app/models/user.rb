class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, foreign_key: "author_id", class_name: "Post", dependent: :destroy
  has_many :replies, foreign_key: "author_id", class_name: "Reply", dependent: :destroy
  has_many :votes, foreign_key: "fan_id", class_name: "Vote", dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :follows, dependent: :destroy

end
