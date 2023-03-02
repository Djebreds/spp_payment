class MonthlySpp < ApplicationRecord
  belongs_to :budget_spp

  validates :month, :amount, presence: true
end
