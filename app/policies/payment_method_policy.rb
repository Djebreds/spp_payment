class PaymentMethodPolicy < ApplicationPolicy
  attr_reader :current_admin, :payment_method

  def initialize(current_admin, payment_method)
    @current_admin = current_admin
    @payment_method = payment_method
  end
  
  def index?
    current_admin.admin?
  end

  def create?
    current_admin.admin?
  end

  def update?
    current_admin.admin?
  end

  def destroy?
    current_admin.admin?
  end
end