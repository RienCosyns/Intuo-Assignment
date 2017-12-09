class FoodTemplate
  attr_reader :exp_date, :brand_name
  def initialize
    @exp_date = Faker::Date.between(Date.today, 3.days.from_now)
    @brand_name = ["Cheap", "Expensive"].sample
    @volume = nil
    @size = nil
    @color = nil
  end
end

class MilkTemplate < FoodTemplate
  def initialize
    super
    @volume = ["0.5l", "1l"].sample
  end
end

class WaterTemplate < FoodTemplate
  def initialize
    super 
    @exp_date = nil
    @brand_name = nil
  end
end

class BreadTemplate < FoodTemplate
  def initialize
    super
    @size = ["big", "small"].sample
  end
end

class MeatTemplate < FoodTemplate
end

class CarrotTemplate < FoodTemplate
  def initialize
    super
    @color = ["orange", "purple", "white"].sample
  end
end

class GrassTemplate < FoodTemplate
  def initialize
    super
    @exp_date = nil
    @brand_name = nil
  end
end

# food_type = ["Milk", "Water", "Grass", "Meat", "Bread", "Carrot"].sample
# food = food_type.constantize.new

# puts food.exp_date
# puts food.brand_name
