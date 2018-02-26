class IdeaSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :description, :owner_id, :date_suggestions, :idea_comments
end
