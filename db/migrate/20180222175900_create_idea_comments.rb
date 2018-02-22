class CreateIdeaComments < ActiveRecord::Migration[5.1]
  def change
    create_table :idea_comments do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :idea, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
