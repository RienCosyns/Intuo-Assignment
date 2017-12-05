class PetTemplate
  attr_reader :name, :date_of_death, :age

  def initialize
    @name = Faker::Name.first_name
    @date_of_death = Faker::Date.between(2.years.ago, 2.years.from_now)
    @age = rand(1..180)
  end

  def fav_food
    @fav_food = []
    rand(1..@restricted_food.length).times do 
      @fav_food << @restricted_food.sample
    end
    @fav_food.uniq
  end

end
  
class Dog < PetTemplate
  def initialize
    super
    @restricted_food = ["water", "meat"]
  end
end

class Cat < PetTemplate
  def initialize
    super
    @restricted_food = ["water", "milk", "bread"]
  end
end

class Mouse < PetTemplate

  def initialize
    super
    @restricted_food = ["water", "cheese"]
  end
end

class Horse < PetTemplate
  def initialize
    super
    @restricted_food = ["water", "grass", "carrot"]
  end
end

# type = ["Cat", "Dog", "Horse", "Mouse"].sample
# pet = type.constantize.new

# puts pet.name
# puts pet.age
# puts pet.class
# puts pet.fav_food


  