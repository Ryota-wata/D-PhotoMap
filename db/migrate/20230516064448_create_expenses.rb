class CreateExpenses < ActiveRecord::Migration[6.1]
  def change
    create_table :expenses do |t|
      t.date :day, null: false
      t.integer :total, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
