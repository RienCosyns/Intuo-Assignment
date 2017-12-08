class User < ApplicationRecord
  has_many :pets, dependent: :destroy
  has_one :fridge
  before_save :age, :downcase_email, :has_fridge?, :count_living_animals

  validates :f_name, :l_name, :date_of_birth, :email, presence: true
  validates :f_name, :l_name, length: {minimum: 2, maximum: 50}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
          length: {maximum: 255}, 
          format: {with: VALID_EMAIL_REGEX}, 
          uniqueness: {case_sensitive: false}

  # validates :amount_of_pets, numericality: {
  #   only_integer: true,
  #   greater_than_or_equal_to: 0,
  #   less_than: 4
  # }

  private 
    def downcase_email 
      email.downcase!
    end

    def has_fridge?
      if age >= 18
        self.has_fridge = true
      end
    end

    def count_living_animals
      self.amount_of_pets = pets.where("date_of_death IS NULL").count
    end

end