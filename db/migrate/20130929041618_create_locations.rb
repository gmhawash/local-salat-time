class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :nickname
      t.string :name
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :province
      t.string :country
      t.string :postal_code
      t.string :longitude
      t.string :latitude
      t.string :website
      t.string :phone
      t.string :email

      t.timestamps
    end
    add_index :locations, :nickname, unique: true
  end
end
