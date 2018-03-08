class Invitation < ApplicationRecord
  belongs_to :invitee, class_name: "User"
  belongs_to :idea

  validate :invitation_should_not_already_exist, on: :create

  def invitation_should_not_already_exist
    if self.class.where(invitee_id: invitee_id, idea_id:idea_id).exists?
      self.errors.add(:invitee_id, 'Already invited!')
    end
  end

end
