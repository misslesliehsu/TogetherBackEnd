class CreateInvitations < ActiveRecord::Migration[5.1]
  def change
    create_table :invitations do |t|
      t.belongs_to :invitee
      t.belongs_to :idea, foreign_key: true

      t.timestamps
    end
  end
end
