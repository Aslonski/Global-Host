class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :body
      t.integer :score, null: false, default: 0
      t.integer :reviewer_id
      t.integer :reviewed_user_id

      t.timestamps null: false
    end
  end
end
