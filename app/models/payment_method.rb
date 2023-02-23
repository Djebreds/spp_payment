class PaymentMethod < ApplicationRecord
  belongs_to :payment, dependent: :destroy

  validates :name, presence: true
end
