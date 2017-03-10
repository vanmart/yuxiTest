class CreateParkings < ActiveRecord::Migration[5.0]
  def change
    create_table :parkings do |t|
      t.string :name
      t.string :address
      t.string :email
      t.string :phone
      t.text :message

      t.timestamps
    end
  end
end
