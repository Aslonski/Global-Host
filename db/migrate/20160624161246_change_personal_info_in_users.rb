class ChangePersonalInfoInUsers < ActiveRecord::Migration
  def change
      change_column :users, :personal_info, :text
  end
end
