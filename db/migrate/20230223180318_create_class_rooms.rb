class CreateClassRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :class_rooms do |t|
      t.string :name, null: false

      t.references :major, null: false, foreign_key: true
      t.timestamps
    end
  end
end
