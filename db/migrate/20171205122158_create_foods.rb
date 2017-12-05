class CreateFoods < ActiveRecord::Migration[5.1]
  def change
    create_table :foods do |t|
      t.datetime :exp_date
      t.string :brand_name
      t.string :food_type
      t.references :fridge, foreign_key: true

      t.timestamps
    end
  end
end
