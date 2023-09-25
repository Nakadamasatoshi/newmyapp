class RemoveAddressFromProfiles < ActiveRecord::Migration[7.0]
  def change
    remove_column :profiles, :address, :string
  end
end
