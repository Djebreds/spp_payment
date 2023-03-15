class MonthlySpp < ApplicationRecord
  belongs_to :budget_spp
  has_many :payments, dependent: :destroy

  validates :month, :amount, presence: true
end
