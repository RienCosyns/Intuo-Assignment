class Fridge < ApplicationRecord
  belongs_to :user
  has_many :foods
end
