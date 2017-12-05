class UserTemplate
  attr_reader :f_name, :l_name, :age, :email, :amount_of_pets
  
  def initialize
    @f_name = Faker::Name.first_name
    @l_name = Faker::Name.last_name
    @email = Faker::Internet.free_email(@f_name)
    @age = rand(1..100)
    @amount_of_pets = rand(0..3)
  end

  def has_fridge?
    @age >= 18
  end
end