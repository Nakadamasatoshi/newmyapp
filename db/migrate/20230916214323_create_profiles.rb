class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :nickname
      t.string :familyname
      t.string :firstname
      t.string :birthdate
      t.integer :phonenumber
      t.integer :postalcode
      t.string :address
      t.string :comment
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
