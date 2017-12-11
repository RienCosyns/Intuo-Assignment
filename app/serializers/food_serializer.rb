class FoodSerializer < ActiveModel::Serializer
  
  attributes :id, :type, :exp_date, :brand_name
end

class BreadSerializer < FoodSerializer
  attributes :size
end

class MilkSerialzer < FoodSerializer
  attributes :volume
end

class CarrotSerializer < FoodSerializer
  attributes :color
end