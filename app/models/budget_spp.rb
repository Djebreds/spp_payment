class BudgetSpp < ApplicationRecord
  belongs_to :generation, dependent: :destroy
  has_many :monthly_spp, dependent: :destroy
  belongs_to :payment, dependent: :destroy
end
