class RenameColumnInPets < ActiveRecord::Migration[5.1]
  def change
    rename_column :pets, :animal_type, :type
  end
end
