class Major < ApplicationRecord
  has_many :class_rooms, dependent: :delete_all

  validates :name, :short, presence: true
end
