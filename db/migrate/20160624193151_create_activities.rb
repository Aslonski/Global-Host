class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :description
      t.integer :itinerary_id
      t.integer :location_id

      t.timestamps null: false
    end
  end
end
