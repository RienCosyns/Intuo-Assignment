require 'test_helper'

class PetTest < ActiveSupport::TestCase
  def setup
    @user = users(:user)
    @cat = pets(:cat)
    @dog = pets(:dog)
    @horse = pets(:horse)
    @mouse = pets(:mouse)
  end

  test "name can't be blank" do
    @pet.name = " "
    assert_not @pet.valid?
  end

  test "date of birth can't be blank" do 
    @pet.date_of_birth = "  "
    assert_not @pet.valid?
  end

  test "date of birth can't be in the future" do 
    @pet.date_of_birth = 2.years.from_now
    assert_not @pet.valid?
  end

  test "date of birth is in the past" do 
    @pet.date_of_birth = 2.years.ago
    assert @pet.valid?, "#{@pet.age}, #{@pet.date_of_birth}, #{@pet.name}, #{@pet.valid?}, #{@pet.errors.full_messages}"
  end
end
