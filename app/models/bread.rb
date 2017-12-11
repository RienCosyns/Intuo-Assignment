class Bread < Food
  before_save :set_to_nil
  validates :size, inclusion: { in: %w(small big) }
end