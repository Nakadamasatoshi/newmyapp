class AddMakerToMachines < ActiveRecord::Migration[7.0]
  def change
    add_column :machines, :maker, :string
    add_column :machines, :price, :integer
    add_column :machines, :model, :string
  end
end
