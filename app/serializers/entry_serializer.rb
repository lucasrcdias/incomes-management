class EntrySerializer < ActiveModel::Serializer
  attributes :id, :value, :created_at, :description, :added_at

  belongs_to :category
end
