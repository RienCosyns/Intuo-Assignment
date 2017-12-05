require 'test_helper'

class PetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @pet = Pet.new(name: "Snuffles", age: 15, date_of_death: 1.day.from_now, animal_type: "Dog", fav_food: "meat")
  end

  test "not allowed food should be invalid" do
    @pet.fav_food = "cola"
    assert_not @pet.valid?
  end

  test "allowed food should be valid" do
    assert @pet.valid?
  end
end
