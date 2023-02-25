class BudgetSpp < ApplicationRecord
  belongs_to :generation, dependent: :destroy
  has_many :monthly_spp, dependent: :destroy
  has_many :payment, dependent: :destroy
end
