class PetSerializer < ActiveModel::Serializer
  # belongs_to :user, key: :owner

  attributes :name, :date_of_birth, :age, :fav_food
  attribute :type, key: :animal
end
