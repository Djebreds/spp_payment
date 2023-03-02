class ClassRoom < ApplicationRecord
  belongs_to :major
  has_many :students, dependent: :delete_all

  validates :name, presence: true, length: { minimum: 4, maximum: 50 }
end
