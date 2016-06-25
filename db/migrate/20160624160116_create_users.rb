class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :city
      t.string :state_province
      t.string :country
      t.string :personal_info
      t.string :language
      t.string :gender
      t.string :role

      t.timestamps null: false
    end
  end
end
