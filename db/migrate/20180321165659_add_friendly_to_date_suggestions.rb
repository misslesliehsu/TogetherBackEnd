class AddFriendlyToDateSuggestions < ActiveRecord::Migration[5.1]
  def change
    add_column :date_suggestions, :friendly_date, :string
  end
end
