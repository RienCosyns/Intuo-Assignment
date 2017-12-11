# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require_relative "user_template"
# require_relative "pet_template"
# require_relative "fridge_template"
# require_relative "food_template"

def Food.define_food(food)
    if food.type == 'Water' || food.type == 'Grass'
      food.exp_date = nil
      food.brand_name = nil
    elsif food.type == 'Bread'
      food.size = ["big", "small"].sample
    elsif food.type == 'Milk'
      food.volume = ['0.5l', '1l'].sample
    elsif food.type == 'Carrot'
      food.color = ["orange", "purple", "white"].sample
    end
    food.save
end

# create 500 users 
500.times do 
  user = UserTemplate.new

  User.create!(
    f_name: user.f_name,
    l_name: user.l_name,
    email: user.email,
    date_of_birth: user.date_of_birth
  )

end

User.all.each do |user|
  rand(0..3).times do 
    pet = Pet.types.sample
     
    new_pet = pet.constantize.new(
      name: Faker::Name.first_name,
      date_of_birth: Faker::Date.birthday((1/12), 15),
      user_id: user.id
    )

    new_pet.fav_food = new_pet.restricted_food.sample
    new_pet.save
    
  end
  if user.has_fridge
    fridge = Fridge.types.sample

    new_fridge = fridge.constantize.create!(
      last_check_date: Faker::Date.between(5.years.ago, Date.today),
      user_id: user.id
    )

    rand(1..10).times do
      food = Food.types.sample

      new_food = food.constantize.new(
        exp_date: Faker::Date.between(Date.today, 3.days.from_now),
        brand_name: ["Cheap", "Expensive"].sample,
        fridge_id: new_fridge.id
      )

      Food.define_food(new_food)
    end
  end
  user.save
end
