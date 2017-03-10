class CreateFeeTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :fee_types do |t|
      t.string :name
      t.float :price
      t.integer :vehicle_type_id
      t.integer :parking_id
      t.integer :fee_time_id

      t.timestamps
    end
  end
end
