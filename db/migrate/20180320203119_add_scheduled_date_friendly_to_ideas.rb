class AddScheduledDateFriendlyToIdeas < ActiveRecord::Migration[5.1]
  def change
    add_column :ideas, :scheduled_date_friendly, :string
  end
end
