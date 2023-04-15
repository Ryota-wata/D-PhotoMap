class CreatePhotos < ActiveRecord::Migration[6.1]
  def change
    create_table :photos do |t|
      t.date :day, null: false
      t.string :park, null: false
      t.string :area
      t.string :body
      t.string :image
      t.float :latitude
      t.float :longitude
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
