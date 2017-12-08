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
  user.save
end