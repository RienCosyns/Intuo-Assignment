class UserTemplate
  attr_reader :f_name, :l_name, :date_of_birth, :email, :amount_of_pets
  
  def initialize
    @f_name = Faker::Name.unique.first_name
    @l_name = Faker::Name.last_name
    @email = Faker::Internet.free_email(@f_name)
    @date_of_birth = Faker::Date.birthday(0, 100)
    @amount_of_pets = rand(0..3)
  end

  def has_fridge?
    @age >= 18
  end
end