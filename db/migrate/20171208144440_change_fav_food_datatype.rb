class ChangeFavFoodDatatype < ActiveRecord::Migration[5.1]
  def change
    change_column :pets, :fav_food, :text
  end
end
