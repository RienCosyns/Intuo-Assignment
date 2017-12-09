class Bread < Food
  attr_accessor :size

  validates :size, inclusion: { in: %w(small big) }

end