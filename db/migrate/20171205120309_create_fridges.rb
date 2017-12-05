class CreateFridges < ActiveRecord::Migration[5.1]
  def change
    create_table :fridges do |t|
      t.string :brand
      t.datetime :last_check_date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
