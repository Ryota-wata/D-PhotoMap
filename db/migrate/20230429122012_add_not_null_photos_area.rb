class AddNotNullPhotosArea < ActiveRecord::Migration[6.1]
  def change
    change_column_null :photos, :area, false
  end
end
