class CreateMajors < ActiveRecord::Migration[7.0]
  def change
    create_table :majors do |t|
      t.string :name, null: false
      t.string :short, null: false
      
      t.timestamps
    end
  end
end
