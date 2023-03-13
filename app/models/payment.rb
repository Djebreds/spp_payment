class Payment < ApplicationRecord
  belongs_to :payment_method
  belongs_to :student
  belongs_to :admin
  belongs_to :budget_spp
  

  validates :payment_date, :confirmation_date, :total, :description, 
            :total, presence: true

  enum status: { initial: 0, arrears: 1, completed: 2 }

  before_save :check_status_payyed
  before_update :check_status_payyed

  def check_status_payyed
    get_amount = budget_spp.monthly_spps.sum(:amount)

    if get_amount >= self.total
      self.status = :arrears
    elsif get_amount <= self.total || get_amount == self.total
      self.status = :completed
    else
      self.status = :initial
    end
  end
end
