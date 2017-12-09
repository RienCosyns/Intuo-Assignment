class Carrot < Bread
  attr_accessor :color
  
  validates :color, inclusion: { in: %w(orange purple white) }
end