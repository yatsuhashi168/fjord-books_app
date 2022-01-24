# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :following_relationships, class_name: 'FollowRelationship', foreign_key: 'follower_id', dependent: :destroy, inverse_of: 'follower'
  has_many :followed_relationships, class_name: 'FollowRelationship', foreign_key:  'followed_id', dependent: :destroy, inverse_of: 'followed'

  has_many :followings, through: :following_relationships, source: :followed
  has_many :followers, through: :followed_relationships, source: :follower

  def following?(other_user)
    followings.include?(other_user)
  end
end
