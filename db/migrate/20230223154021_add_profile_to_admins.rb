class AddProfileToAdmins < ActiveRecord::Migration[7.0]
  def change
    add_column :admins, :name, :string, null: false, limit: 50
    add_column :admins, :nip, :string, null: false, limit: 10
    add_column :admins, :address, :text
    add_column :admins, :phone, :string, limit: 13
    add_column :admins, :status, :integer, null: false, limit: 1

    add_index :admins, [:nip], unique: true
  end
end
