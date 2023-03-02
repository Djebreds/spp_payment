class Student < ApplicationRecord
  has_many :payments, dependent: :delete_all
  belongs_to :class_room
  belongs_to :generation
  
  validates :name, :address, presence: true
  validates :nisn, :nis, :phone, presence: true, uniqueness: true
  validates :nisn, format: { with: /\d{10}/ }
  validates :phone, format: { with: /\A(628)(\d{7,14}$)\z/ }

  enum status: { inactive: 0, active: 1 }
  
  devise :database_authenticatable, :rememberable, :validatable, :authentication_keys => [:nis]
end
