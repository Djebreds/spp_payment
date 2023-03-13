class Payment < ApplicationRecord
  belongs_to :payment_method
  belongs_to :student
  belongs_to :admin
  has_many :budget_spps, dependent: :destroy

  validates :payment_date, :confirmation_date, :total, :description, 
            :total, presence: true

  enum status: { initial: 0, arrears: 1, completed: 2 }
end
