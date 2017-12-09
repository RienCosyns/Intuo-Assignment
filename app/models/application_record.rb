class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def age
    Date.today.year - date_of_birth.year
  end

  def realistic_birthdate
    if date_of_birth.present? && date_of_birth > Date.today
      errors.add(:date_of_birth, "can't be in the future")
    end
  end
end
