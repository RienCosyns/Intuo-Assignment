class Meat < Food
  before_save :set_to_nil
end