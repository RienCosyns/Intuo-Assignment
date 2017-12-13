class PetSerializer < ActiveModel::Serializer
  include NullAttributesRemover
  belongs_to :user, key: :owner

  attributes :name, :date_of_birth, :age, :fav_food, :date_of_death
  attribute :type, key: :animal
end
