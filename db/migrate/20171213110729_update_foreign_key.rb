class UpdateForeignKey < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :fridges, :users
    add_foreign_key :fridges, :users, on_delete: :cascade
  end
end
