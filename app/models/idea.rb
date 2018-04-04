class Idea < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :invitations, dependent: :destroy #if idea dies, so do invitations
  has_many :invitees, through: :invitations
  has_many :idea_comments, dependent: :destroy 

  has_many :date_suggestions, dependent: :destroy #if idea dies, so do date_suggestions

  validates_presence_of :name, :owner_id
end
