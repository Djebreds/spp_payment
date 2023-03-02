class ClassMajor < ApplicationRecord
  belongs_to :major
  belongs_to :class_room
  has_many :students, dependent: :destroy

  validates :name, presence: true
end
