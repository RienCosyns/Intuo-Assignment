class FoodTemplate
  attr_reader :exp_date, :brand_name
  def initialize
    @exp_date = Faker::Date.between(Date.today, 3.days.from_now)
    @brand_name = ["Cheap", "Expensive"].sample
    @volume = nil
    @size = nil
    @color = nil
  end

  def full_text
    "#{@volume || @size || @color || ''} #{self.class}"
  end
end

class Milk < FoodTemplate
  def initialize
    super
    @volume = ["0.5l", "1l"].sample
  end
end

class Water < FoodTemplate
  def initialize
    super 
    @exp_date = nil
    @brand_name = nil
  end
end

class Bread < FoodTemplate
  def initialize
    super
    @size = ["big", "small"].sample
  end
end

class Meat < FoodTemplate
end

class Carrot < FoodTemplate
  def initialize
    super
    @color = ["orange", "purple", "white"].sample
  end
end

class Grass < FoodTemplate
  def initialize
    super
    @exp_date = nil
    @brand_name = nil
  end
end

food_type = ["Milk", "Water", "Grass", "Meat", "Bread", "Carrot"].sample
food = food_type.constantize.new

puts food.exp_date
puts food.brand_name
puts food.full_text