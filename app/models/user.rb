class User < ApplicationRecord
  has_many :friendships, dependent: :destroy  #if user is destroyed, so is friendship(s)
  has_many :friends, through: :friendships
end
