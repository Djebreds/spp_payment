class Major < ApplicationRecord
  has_many :class_room, dependent: :destroy

  validates :name, :short, presence: true, length: { minimum: 2, maximum: 50 }
end
