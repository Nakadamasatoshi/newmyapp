class AddPrefectureotherToProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :prefecture, :string
    add_column :profiles, :city, :string
    add_column :profiles, :town, :string
    add_column :profiles, :buildingname, :string
  end
end
