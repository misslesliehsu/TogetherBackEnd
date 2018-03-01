class IdeaSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :description, :owner_id, :scheduled_date, :invitees
  has_many :date_suggestions
end
