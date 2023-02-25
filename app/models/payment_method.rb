class PaymentMethod < ApplicationRecord
  has_many :payment, dependent: :destroy

  validates :name, presence: true
end
