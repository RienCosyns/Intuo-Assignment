class AddDateOfBirthToPets < ActiveRecord::Migration[5.1]
  def change
    add_column :pets, :date_of_birth, :datetime
  end
end
