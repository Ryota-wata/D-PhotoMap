class CreateDiaries < ActiveRecord::Migration[6.1]
  def change
    create_table :diaries do |t|
      t.date :day, null: false
      t.string :title, null: false
      t.text :body, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
