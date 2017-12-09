require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.create(
      f_name: "John",
      l_name: "Doe",
      date_of_birth: Faker::Date.birthday(1,100),
      email: "John.Doe@example.com",
      amount_of_pets: rand(0..3)
      )
  end

  test "First name can't be blank" do
    @user.f_name = '  '
    assert_not @user.valid?
  end

  test "first name can't be too long" do
    @user.f_name = "a" * 51
    assert_not @user.valid?
  end

  test "last name can't be too long" do
    @user.l_name = "a" * 51
    assert_not @user.valid?
  end

  test "Last name can't be blank" do
    @user.l_name = '  '
    assert_not @user.valid?
  end

  test "date of birth is valid" do
    @user.date_of_birth = 2.years.from_now
    assert_not @user.valid?
    @user.date_of_birth = ' '
    assert_not @user.valid?
  end

  test "age can't be blank" do
    assert_not @user.age.nil?
  end

  test "email validations should accept valid email addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@bar.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email can't be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "amount of pets has to be in range 0 - 3" do
    @user.amount_of_pets = 4
    assert_not @user.valid?
    @user.amount_of_pets = -1
    assert_not @user.valid?
  end

  test "users olders than 18 should have a fridge" do
    @user.date_of_birth = Faker::Date.birthday(18, 100)
    @user.save
    assert @user.has_fridge
  end
  
  test "users younger than 18 can't have a fridge" do 
    @user.date_of_birth = Faker::Date.birthday(0, 17)
    @user.save
    assert_not @user.has_fridge
  end
end
