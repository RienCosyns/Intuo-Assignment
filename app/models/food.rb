class Food < ApplicationRecord
  belongs_to :fridge

  validates :exp_date, :brand_name, presence: true
  validate :expired_food
  validates :brand_name, inclusion: {in: %w(Cheap Expensive)}


  def self.types
    %w(Grass Water Milk Meat Carrot Bread)
  end

  private
    def expired_food
      if exp_date > (Date.today + 3)
        errors.add(:exp_date, 'too far in the future')
      elsif exp_date < Date.today
        errors.add(:exp_date, "can't be in the past")
      end
    end
end
