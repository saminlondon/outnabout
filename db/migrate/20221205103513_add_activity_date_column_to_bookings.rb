class AddActivityDateColumnToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :activity_date, :date
  end
end
