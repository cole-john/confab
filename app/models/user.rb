# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  avatar_img             :string
#  bio                    :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  favorites_count        :integer          default(0)
#  follows_count          :integer          default(0)
#  posts_count            :integer          default(0)
#  remember_created_at    :datetime
#  replies_count          :integer          default(0)
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  username               :citext
#  votes_count            :integer          default(0)
#  website                :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_username              (username) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, foreign_key: 'author_id', class_name: 'Post', dependent: :destroy
  has_many :replies, foreign_key: 'author_id', class_name: 'Reply', dependent: :destroy
  has_many :votes, foreign_key: 'fan_id', class_name: 'Vote', dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :follows, dependent: :destroy

  has_many :favorite_posts, through: :favorites, source: :favoritable, source_type: "Post"
  has_many :favorite_replies, through: :favorites, source: :favoritable, source_type: "Reply"
  has_many :followed_posts, through: :follows, source: :post

  
  validates :username, presence: true, uniqueness: true
end
