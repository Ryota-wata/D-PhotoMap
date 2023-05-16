class CreateExpenseItems < ActiveRecord::Migration[6.1]
  def change
    create_table :expense_items do |t|
      t.references :expense, foreign_key: true
      t.string :name, null: false
      t.integer :price, null: false
      t.integer :quantity, null: false
      t.integer :subtotal, null: false

      t.timestamps
    end
  end
end
