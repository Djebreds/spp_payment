class AddClassRoomMajorToStudents < ActiveRecord::Migration[7.0]
  def change
    add_reference :students, :class_room_major, null: false, foreign_key: true
  end
end
