class Grass < Food
  validates :exp_date, :brand_name, absence:true
end