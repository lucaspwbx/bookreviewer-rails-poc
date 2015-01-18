class Book
  include Mongoid::Document

  field :name, type: String
  field :pages, type: Integer
  field :language, type: String

  embeds_many :reviews
end
