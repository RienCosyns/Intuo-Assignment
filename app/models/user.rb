class User < ApplicationRecord
  has_many :pets, dependent: :destroy
  has_one :fridge
end