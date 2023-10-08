class AddMachineIdToProfiles < ActiveRecord::Migration[7.0]
  def change
    add_reference :profiles, :machine, foreign_key: true
  end
end
