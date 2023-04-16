class CreateDiaries < ActiveRecord::Migration[6.1]
  def change
    create_table :diaries do |t|
      t.date :day, null: false
      t.string :title, null: false
      t.string :body, null: false
      t.string :lottely_facility
      t.string :lottely_time
      t.string :lottely_result
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
