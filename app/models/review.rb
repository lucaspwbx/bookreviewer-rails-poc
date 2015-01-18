class Review
  include Mongoid::Document

  field :description, type: String
  field :name, type: String

  embedded_in :book
end
