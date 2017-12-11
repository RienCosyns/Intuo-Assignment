class AddColumnAge < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :age, :integer
    add_column :pets, :age, :integer
  end
end
