class Admin < ApplicationRecord
  
  enum roles: [:admin, :staff]
  enum status: { inactive: 0, active: 1 }
  
  devise :database_authenticatable, :rememberable, 
         :validatable, :trackable, :authentication_keys => [:nip]
  after_initialize :set_default_role, :if => :new_record?

  private

  def set_default_role
    self.roles ||= :staff
  end
end
