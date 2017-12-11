class Water < Food
  before_save :set_to_nil
  
  validates :exp_date, :brand_name, absence:true
end