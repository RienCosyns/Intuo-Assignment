class FridgeTemplate
  attr_reader :brand, :last_check_date
  def initialize
    @brand = [:Siemens, :Whirlpool, :AEG].sample
    @last_check_date = Faker::Date.between(5.years.ago, Date.today)
  end
end

fridge = FridgeTemplate.new
puts fridge.brand
puts fridge.last_check_date