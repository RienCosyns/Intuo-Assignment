class AddColumnsToFoods < ActiveRecord::Migration[5.1]
  def change
    add_column :foods, :size, :string
    add_column :foods, :volume, :string
    add_column :foods, :color, :string
  end
end
