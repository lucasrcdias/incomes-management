class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :kind, :icon, :planned
end
