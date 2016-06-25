class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :first_name
      t.string  :last_name
      t.string  :email
      t.string  :city
      t.string  :state_province
      t.string  :country
      t.text    :personal_info
      t.string  :language
      t.string  :gender
      t.string  :password_digest
      t.boolean :is_host, default: false

      t.timestamps null: false
    end
  end
end
