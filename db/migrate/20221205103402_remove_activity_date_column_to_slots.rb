class RemoveActivityDateColumnToSlots < ActiveRecord::Migration[7.0]
  def change
    remove_column :slots, :activity_date, :date
  end
end
