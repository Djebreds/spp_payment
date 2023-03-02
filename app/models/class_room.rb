class ClassRoom < ApplicationRecord
  has_many :class_majors, dependent: :destroy

  validates :name, presence: true
end
