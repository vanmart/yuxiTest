class CreateFeeTimes < ActiveRecord::Migration[5.0]
  def change
    create_table :fee_times do |t|
      t.string :name
      t.string :seconds

      t.timestamps
    end
  end
end
