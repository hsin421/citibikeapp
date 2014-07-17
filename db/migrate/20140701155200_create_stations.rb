class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.integer :position
      t.integer :dock_id
      t.integer :available
      t.integer :total_docks
      t.string :address

      t.timestamps
    end
  end
end
