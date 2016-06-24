class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :body
      t.integer :conversation
      t.integer :user
      t.boolean :read

      t.timestamps(null: false)
    end
  end
end
