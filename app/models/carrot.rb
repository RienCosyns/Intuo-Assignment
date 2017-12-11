class Carrot < Food
  before_save :set_to_nil
  validates :color, inclusion: { in: %w(orange purple white) }
end