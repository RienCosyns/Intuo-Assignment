class FoodSerializer < ActiveModel::Serializer
  include NullAttributesRemover
  belongs_to :fridge
  attributes :type, :exp_date, :brand_name, :size, :volume, :color
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