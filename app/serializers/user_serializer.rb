class UserSerializer < ActiveModel::Serializer
  has_many :pets
  has_one :fridge
  
  attributes :f_name, :l_name, :age, :email, :has_fridge
end
