class Payment < ApplicationRecord
  has_many :payment_method
  belongs_to :student
  belongs_to :admin
  has_many :budget_spp

  validates :payment_date, :confirmation_date, :total, :description, 
            :total, presence: true

  enum status: { initial: 0, pending: 1, completed: 2, failed: 4 }
end
