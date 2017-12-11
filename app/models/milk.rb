class Milk < Food
  before_save :set_to_nil

  validates :volume, inclusion: { in: %w(0.5l 1l) }
  
end