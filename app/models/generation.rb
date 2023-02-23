class Generation < ApplicationRecord
  has_many :budget_spp, dependent: :destroy
  has_many :student, dependent: :destroy

  validates :years, presence: true, length: { is: 9 }
end
