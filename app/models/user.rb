class User < ApplicationRecord
  has_many :pets, dependent: :destroy
  has_one :fridge, dependent: :destroy
  before_save :downcase_email, :has_fridge?, :count_living_animals, :set_age

  validates :f_name, :l_name, :date_of_birth, :email, presence: true
  validates :f_name, :l_name, length: {minimum: 2, maximum: 50}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
          length: {maximum: 255}, 
          format: {with: VALID_EMAIL_REGEX}, 
          uniqueness: {case_sensitive: false}

  validates :amount_of_pets, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0,
    less_than: 4
  }, allow_nil: true

  validate :realistic_birthdate

  scope :fridge_type, -> (type) {joins(:fridge).where ("fridges.type = ?"), type}
  scope :fridge_last_checkup_before, -> (date) {joins(:fridge).where ("fridges.last_check_date < ?"), date}
  scope :fridge_last_checkup_after, -> (date) {joins(:fridge).where ("fridges.last_check_date > ?"), date}
  scope :pet_type, -> (animal) {joins(:pets).where ("pets.type = ?"), animal}
  scope :food_type, -> (food) {joins(fridge: :foods).where ("foods.type = ?"), food}
  scope :carrot_color, -> (color) {food_type("Carrot").where ("foods.color = ? "), color }
  scope :brand_name, -> (brand) {joins(fridge: :foods).where ("foods.brand_name = ?"), brand}
  scope :amount, -> (amount) {group}
  
  private 
    def downcase_email 
      email.downcase!
    end

    def has_fridge?
      self.has_fridge = age > 18 ? true : false
    end

    def count_living_animals
      self.amount_of_pets = pets.where("date_of_death IS NULL").count
    end

end