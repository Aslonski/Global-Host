class RemoveRoleAddIsHostInUsers < ActiveRecord::Migration
  def change
    remove_column :users, :role, :string
    add_column :users, :is_host, :boolean
  end
end
