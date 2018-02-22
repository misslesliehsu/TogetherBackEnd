class CreateIdeas < ActiveRecord::Migration[5.1]
  def change
    create_table :ideas do |t|
      t.string :name
      t.string :location
      t.belongs_to :owner
      t.string :description

      t.timestamps
    end
  end
end
