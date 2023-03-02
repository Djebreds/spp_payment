class Major < ApplicationRecord
  has_many :class_majors, dependent: :destroy

  validates :name, :short, presence: true
end
