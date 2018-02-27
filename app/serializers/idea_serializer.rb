class IdeaSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :description, :owner_id, :invitees
  has_many :date_suggestions
end
