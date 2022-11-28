class CreateActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :activities do |t|
      t.string :name
      t.text :description
      t.datetime :operational_start_time
      t.integer :activity_party_size
      t.integer :price
      t.string :category
      t.datetime :operational_end_time
      t.references :venue, null: false, foreign_key: true

      t.timestamps
    end
  end
end
