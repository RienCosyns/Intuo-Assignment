require_relative "user_template"
require_relative "pet_template"
require_relative "fridge_template"
require_relative "food_template"

# create 500 users 
500.times do 
  user = UserTemplate.new

  new_user = User.create!(
    f_name: user.f_name,
    l_name: user.l_name,
    email: user.email,
    age: user.age,
    has_fridge: user.has_fridge?,
    amount_of_pets: user.amount_of_pets
  )
   # create n amout of pets for every user

  new_user.amount_of_pets.times do
    pet_type = ["Cat", "Dog", "Horse", "Mouse"].sample
    pet = pet_type.constantize.new

    Pet.create!(
      name: pet.name,
      date_of_death: pet.date_of_death,
      age: pet.age,
      animal_type: pet.class,
      fav_food: pet.fav_food,
      user_id: new_user.id
    )
  end

  # if fridge, create fridge + food
  if new_user.has_fridge
    fridge = FridgeTemplate.new

    new_fridge = Fridge.create!(
      brand: fridge.brand,
      last_check_date: fridge.last_check_date,
      user_id: new_user.id
    )

    rand(1..10).times do 
      food_type = ["Milk", "Water", "Grass", "Meat", "Bread", "Carrot"].sample
      food = food_type.constantize.new

      Food.create!(
        exp_date: food.exp_date,
        brand_name: food.brand_name,
        food_type: food.full_text,
        fridge_id: new_fridge.id
      )
    end
  end
end
