class User < ApplicationRecord
  has_many :friendships, dependent: :destroy  #if user is destroyed, so is friendship(s)
  has_many :friends, through: :friendships

  has_many :invitations, foreign_key: "invitee_id", dependent: :destroy
  has_many :hangouts, through: :invitations
  has_many :myideas, class_name: "Idea", foreign_key: "owner_id", dependent: :destroy

  has_secure_password


end
