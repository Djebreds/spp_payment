class AddRolesToAdmins < ActiveRecord::Migration[7.0]
  def change
    add_column :admins, :roles, :integer, limit: 1 
  end
end
