class Admin < ApplicationRecord
  has_many :payments, dependent: :delete_all
  
  validates :name, :address, presence: true
  validates :nip, :phone, presence: true, uniqueness: true
  validates :phone, format: { with: /\A(628)(\d{7,14}$)\z/ }
  
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
