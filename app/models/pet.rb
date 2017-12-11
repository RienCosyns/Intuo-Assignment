class Pet < ApplicationRecord
  belongs_to :user
  before_save :date_of_death, :set_age

  validates :name, presence: true, length: {minimum: 3, maximum: 40}
  validates :date_of_birth, presence: true
  validates :fav_food, presence: true, allow_nil: true
  validate :realistic_birthdate
  validate :allowable_food
  validate :can_eat_food

  scope :type, -> (type) {where type: type}
  scope :fav_food, -> (fav_food) {where fav_food: fav_food}
  scope :older_than, -> (age) {where ("age >= ?"), age}
  scope :younger_than, -> (age) {where ("age < ?"), age}
  scope :user, -> (id) {where ("user_id = ?"), id}

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
