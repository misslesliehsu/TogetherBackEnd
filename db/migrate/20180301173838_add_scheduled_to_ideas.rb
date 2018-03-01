class AddScheduledToIdeas < ActiveRecord::Migration[5.1]
  def change
    add_column :ideas, :scheduled_date, :string
  end
end
