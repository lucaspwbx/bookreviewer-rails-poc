class BookSerializer < ActiveModel::Serializer
  attributes :id, :name, :pages, :language
end
