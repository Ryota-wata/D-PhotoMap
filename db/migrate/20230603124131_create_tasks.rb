class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.string :category
      t.text :content, null: false
      t.jsonb :images
      t.string :status
      t.date :deadline
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
