class DateSuggestion < ApplicationRecord
  belongs_to :idea
  has_many :votes
  has_many :voters, through: :votes

  validates_presence_of :date
end
