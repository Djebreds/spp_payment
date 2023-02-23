class AddProfileToStudents < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :name, :string, null: false, limit: 50
    add_column :students, :photo, :string
    add_column :students, :nisn, :string, null: false, limit: 10 
    add_column :students, :nis, :string, null: false, limit: 9
    add_column :students, :address, :text
    add_column :students, :phone, :string, limit: 13
    add_column :students, :status, :integer, null: false

    add_index :students, [:nis, :nisn], unique: true
  end
end
