class ClassRoom < ApplicationRecord
  belongs_to :major, dependent: :destroy
  has_many :student, dependent: :destroy

  validates :name, presence: true, length: { minimum: 4, maximum: 50 }
end
