class ClassRoom < ApplicationRecord
  has_many :class_room_majors, dependent: :destroy

  validates :name, presence: true
end
