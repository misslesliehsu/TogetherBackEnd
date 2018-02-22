class Vote < ApplicationRecord
  belongs_to :date_suggestion
  belongs_to :user
end
