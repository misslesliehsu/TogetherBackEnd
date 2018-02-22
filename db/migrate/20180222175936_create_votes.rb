class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.belongs_to :date_suggestion, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
