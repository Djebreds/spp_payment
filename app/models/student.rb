class Student < ApplicationRecord
  has_many :payments, dependent: :destroy
  belongs_to :class_room_major
  belongs_to :generation
  has_one_attached :photo, dependent: :destroy
  
  validates :name, :address, presence: true
  validates :nisn, :nis, :phone, presence: true, uniqueness: true
  validates :nisn, format: { with: /\d{10}/ }
  validates :nis, format: { with: /\d{9}/ }
  validates :phone, format: { with: /\A(628)(\d{7,14}$)\z/ }
  validate :acceptable_photo

  enum status: { inactive: 0, active: 1 }
  
  devise :database_authenticatable, :rememberable, :validatable, :authentication_keys => [:nis]

  before_save :check_student_graduate
  before_update :check_student_graduate

  def acceptable_photo
    return unless photo.attached?

    unless photo.blob.byte_size <= 1.megabyte
      errors.add(:photo, "max size is 1 MB") 
    end
  end

  def check_student_graduate
    get_generation = generation.years
    year_graduate = get_generation.split("/")

    if DateTime.current.strftime("%Y") > year_graduate[1]
      self.status = :inactive
    end
  end

  def current_payment_monthly
    payments.find_by(monthly_spp_id: DateTime.current.strftime('%-m'))
  end

  def next_payment_available?
    payments.find_by(monthly_spp_id: 1.month.after.strftime('%-m')).any?
  end

  def has_payment?
    payments.where('monthly_spp_id = ?', DateTime.current.strftime('%B')).any?
  end


end
