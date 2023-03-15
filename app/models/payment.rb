class Payment < ApplicationRecord
  belongs_to :student
  belongs_to :admin
  belongs_to :budget_spp
  belongs_to :monthly_spp, optional: true

  validates :payment_date, :confirmation_date, :total, presence: true

  enum status: { initial: 0, arrears: 1, completed: 2 }

  # before_save :check_status_payyed
  # before_update :check_status_payyed

  def set_default_role
    self.status ||= :initial
  end

  def check_student_has_payyed
    get_amount = budget_spp.monthly_spps.sum(:amount)
  end  

  def check_status_payyed    
    get_month = self.budget_spp_id
    get_amount = budget_spp.monthly_spps.sum(:amount)

    get_payment_month = montly_spp.month
    get_current_month = DateTime.current.strftime('%B')

    if get_amount == self.total
      self.status = :completed
    elsif get_amount <= self.total
      errors.add(:total, "tidak bisa membayar melebihi spp #{get_amount}")
    else
      set_default_role
    end
  end

  def check_student_has_pay
    if students.has_payment?
      errors.add(:total, "siswa ini sudah membayar")
    end
  end

  def check_if_previous_month_has_pay(current_month)
    # if 1.month.ago.strftime('%B')
    #   Student.
    # end
  end

  def check_current_month
    get_payment_month = montly_spp.month
    get_current_month = DateTime.current.strftime('%B')

    # if get_payment_month != get_current_month
    #   errors.add(:title, "")
    # end
  end

end
