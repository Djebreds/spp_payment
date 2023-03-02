class BudgetSpp < ApplicationRecord
  belongs_to :generation
  has_many :monthly_spps, dependent: :delete_all
end
