class Fridge < ApplicationRecord
  belongs_to :user
  has_many :foods, dependent: :destroy

  validates :last_check_date, presence: true
  validate :past_check_date

  def self.types
    %w(Siemens AEG Whirlpool)
  end

  scope :food_type, -> (type) {joins(:foods).where ("foods.type = ?"), type}

  private
    def past_check_date
      if last_check_date > Date.today
        errors.add(:last_check_date, "can't be in the future")
      end
    end
end


class Siemens < Fridge
end

class AEG < Fridge
end

class Whirlpool < Fridge
end