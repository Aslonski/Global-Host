class CreateItineraries < ActiveRecord::Migration
  def change
    create_table :itineraries do |t|
      t.string :name
      t.integer :visitor_id
      t.integer :host_id
      t.string :date

      t.timestamps null: false
    end
  end
end
