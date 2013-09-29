class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.references :location
      t.date :date
      t.integer :hijri
      t.hstore :times

      t.timestamps
    end
  end
end
