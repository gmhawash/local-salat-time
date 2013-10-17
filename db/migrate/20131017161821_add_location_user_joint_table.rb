class AddLocationUserJointTable < ActiveRecord::Migration
  def change
    create_table :locations_users, :index => false do |t|
      t.references :user, :null => false
      t.references :location, :null => false
    end

    add_index :locations_users, [:user_id, :location_id], :unique => true
  end
end
