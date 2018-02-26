class ChangeDateToString < ActiveRecord::Migration[5.1]
  def change
    change_column :date_suggestions, :date, :string
  end
end
