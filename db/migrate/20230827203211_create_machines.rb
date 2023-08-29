class CreateMachines < ActiveRecord::Migration[7.0]
  def change
    create_table :machines do |t|
      t.string :title
      t.integer :length
      t.integer :width
      t.integer :height
      t.integer :horsepower
      t.integer :weight
      t.string :fuel
      t.string :cabin
      t.string :attachment
      t.integer :using_time
      t.string :maintenance
      t.string :transportation
      t.string :supplement

      t.timestamps
    end
  end
end
