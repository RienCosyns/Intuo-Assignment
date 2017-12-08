class PetSerializer < ActiveModel::Serializer
  belongs_to :user, key: :owner

  attributes :name, :age, :date_of_death, :fav_food
  attribute :animal_type, key: :animal
end
