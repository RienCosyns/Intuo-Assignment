class UserSerializer < ActiveModel::Serializer
  has_many :pets
  has_one :fridge
  
  attributes :id, :f_name, :l_name, :date_of_birth, :age, :email, :has_fridge
end
