class Milk < Food
  attr_accessor :volume

  validates :volume, inclusion: { in: %w(0.5l 1l) }
  
end