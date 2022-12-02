class AddDefaultTrueToIsAvailable < ActiveRecord::Migration[7.0]
  def change
    change_column_default(:slots, :is_available, true)
  end
end
