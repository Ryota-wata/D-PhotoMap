class CreateLottelies < ActiveRecord::Migration[6.1]
  def change
    create_table :lottelies do |t|
      t.date :day, null: false
      t.string :facility, null: false
      t.time :time, null: false
      t.string :result, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
