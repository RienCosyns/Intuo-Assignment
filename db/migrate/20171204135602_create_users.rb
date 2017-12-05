class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :f_name
      t.string :l_name
      t.string :email
      t.integer :age
      t.boolean :has_fridge
      t.integer :amount_of_pets
      
      t.timestamps
    end
  end
end
