class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.string  :name
      t.integer :state
      t.integer :vehicle_type_id
      t.integer :parking_id

      t.timestamps
    end
  end
end
