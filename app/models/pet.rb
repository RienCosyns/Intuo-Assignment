class Pet < ApplicationRecord
  belongs_to :user
  before_save :date_of_death

  validates :name, presence: true, length: {minimum: 3, maximum: 40}
  validates :date_of_birth, presence: true
  validates :fav_food, presence: true, allow_nil: true
  validate :realistic_birthdate
  validate :allowable_food
  validate :can_eat_food

  def self.types
    %w(Cat Dog Horse Mouse)
  end


  private 
    def date_of_death
      self.date_of_death = nil unless (age > 15)
    end

    def allowable_food
      if !fav_food.nil?
        food = %w(water grass milk meat carrot bread)
        if !food.include? fav_food.downcase
          errors.add(:fav_food, "is not allowed")
        end
      end
    end

    def can_eat_food
      if !restricted_food.include? fav_food
        errors.add(:fav_food, 'is not allowed for this animal')
      end
    end
end
