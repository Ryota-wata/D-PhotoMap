class AddColumnToLottelies < ActiveRecord::Migration[6.1]
  def change
    add_column :lottelies, :day_of_week, :string
    add_column :lottelies, :start_time, :time
  end
end
