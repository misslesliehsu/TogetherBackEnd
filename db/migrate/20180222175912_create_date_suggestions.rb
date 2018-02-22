class CreateDateSuggestions < ActiveRecord::Migration[5.1]
  def change
    create_table :date_suggestions do |t|
      t.belongs_to :idea, foreign_key: true
      t.integer :date

      t.timestamps
    end
  end
end
