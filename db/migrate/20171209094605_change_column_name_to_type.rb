class ChangeColumnNameToType < ActiveRecord::Migration[5.1]
  def change
    rename_column :foods, :food_type, :type
    rename_column :fridges, :brand, :type
  end
end
