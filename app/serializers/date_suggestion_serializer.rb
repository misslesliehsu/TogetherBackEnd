class DateSuggestionSerializer < ActiveModel::Serializer
  attributes :id, :date, :voters, :friendly_date
end
