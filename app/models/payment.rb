class Payment < ApplicationRecord
  has_many :payment_methods, dependent: :delete_all
  belongs_to :student
  belongs_to :admin
  has_many :budget_spps, dependent: :delete_all

  validates :payment_date, :confirmation_date, :total, :description, 
            :total, presence: true

  enum status: { initial: 0, pending: 1, completed: 2, failed: 4 }
end
