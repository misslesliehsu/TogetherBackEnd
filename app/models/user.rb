class User < ApplicationRecord
  has_many :friendships, dependent: :destroy  #if user is destroyed, so is friendship(s)
  has_many :friends, through: :friendships

  has_many :invitations, foreign_key: "invitee_id", dependent: :destroy
  has_many :ideas, through: :invitations
  has_many :myIdeas, class_name: "Idea", foreign_key: "owner_id", dependent: :destroy

  has_secure_password


end
