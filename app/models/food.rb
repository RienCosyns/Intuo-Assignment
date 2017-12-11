class Food < ApplicationRecord
  belongs_to :fridge

  validates :exp_date, :brand_name, presence: true, allow_nil: true
  validate :expired_food
  validates :brand_name, inclusion: {in: %w(Cheap Expensive)}, allow_nil: true


  def self.types
    %w(Grass Water Milk Meat Carrot Bread)
  end

  private
    def expired_food
      if !exp_date.nil?
        if exp_date > (Date.today + 3)
          errors.add(:exp_date, 'too far in the future')
        elsif exp_date < Date.today
          errors.add(:exp_date, "can't be in the past")
        end
      end
    end

    private
    def set_to_nil 
      self.exp_date = nil if self.type == "Water" || type == "Grass"
      self.brand_name = nil if self.type == "Water" || type == "Grass"
      self.size = nil unless self.type == "Bread"
      self.volume = nil unless self.type == "Milk"
      self.color = nil unless self.type == "Carrot"
    end
end
