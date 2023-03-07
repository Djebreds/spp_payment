class Admin < ApplicationRecord
  has_many :payments, dependent: :delete_all
  has_one_attached :photo, dependent: :destroy
  
  validates :name, :address, presence: true
  validates :nip, :phone, presence: true, uniqueness: true
  validates :phone, format: { with: /\A(628)(\d{7,14}$)\z/ }
  validate :acceptable_photo
  
  enum roles: [:admin, :staff]
  enum status: { inactive: 0, active: 1 }
  
  devise :database_authenticatable, :rememberable, 
         :validatable, :trackable, :authentication_keys => [:nip]
  after_initialize :set_default_role, :if => :new_record?

  private

  def set_default_role
    self.roles ||= :staff
  end

  def acceptable_photo
    return unless photo.attached?

    unless photo.blob.byte_size <= 1.megabyte
      errors.add(:photo, "max size is 1 MB") 
    end
  end
end
