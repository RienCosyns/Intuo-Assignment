class CreatePets < ActiveRecord::Migration[5.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.integer :age
      t.datetime :date_of_death
      t.string :fav_food
      t.string :animal_type
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
