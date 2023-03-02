class CreateClassMajors < ActiveRecord::Migration[7.0]
  def change
    create_table :class_majors do |t|
      t.string :name, null: false

      t.references :class_room, null: false, foreign_key: true
      t.references :major, null: false, foreign_key: true
      t.timestamps
    end
  end
end
