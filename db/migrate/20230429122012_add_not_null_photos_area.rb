class AddNotNullPhotosArea < ActiveRecord::Migration[6.1]
  def change
    change_column_null :photos, :area, false
    change_column_null :photos, :latitude, false
    change_column_null :photos, :longitude, false
  end
end
