class PaymentMethod < ApplicationRecord
  has_many :payments, dependent: :destroy

  validates :name, presence: true
end
