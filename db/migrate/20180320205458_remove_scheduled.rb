class RemoveScheduled < ActiveRecord::Migration[5.1]
  def change
    remove_column :ideas, :scheduled_date_friendly
  end
end
