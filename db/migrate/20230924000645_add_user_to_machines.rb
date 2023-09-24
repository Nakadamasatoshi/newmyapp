class AddUserToMachines < ActiveRecord::Migration[7.0]
  def change
    add_column :machines, :prefecture, :string
    add_column :machines, :city, :string
    add_reference :machines, :user, null: false, foreign_key: true
  end
end
