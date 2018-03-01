class DateSuggestion < ApplicationRecord
  belongs_to :idea
  has_many :votes, dependent: :destroy #if datesuggestion destroyed, so are the votes
  has_many :voters, through: :votes

  validates_presence_of :date
  validates :date, uniqueness: {scope: :idea_id }
end
