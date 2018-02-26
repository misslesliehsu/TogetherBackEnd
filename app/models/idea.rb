class Idea < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :invitations
  has_many :invitees, through: :invitations

  has_many :date_suggestions

  validates_presence_of :name, :owner_id
end
