class CreateFees < ActiveRecord::Migration[5.0]
  def change
    create_table :fees do |t|
      t.datetime :entry_date
      t.datetime :exit_date
      t.float :value
      t.integer :fee_type_id
      t.string :vehicle_plate
      t.integer :user_id
      t.integer :place_id

      t.timestamps
    end
  end
end
