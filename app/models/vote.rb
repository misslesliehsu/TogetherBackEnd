class Vote < ApplicationRecord
  belongs_to :date_suggestion
  belongs_to :voter, class_name: "User"
end
