class AddForeignKeyToMachines < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :machines, :users
  end
end
