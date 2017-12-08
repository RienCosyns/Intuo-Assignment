class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def age
    self.age = Date.today.year - date_of_birth.year
  end
end
