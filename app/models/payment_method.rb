class PaymentMethod < ApplicationRecord
  has_many :payments, dependent: :delete_all

  validates :name, presence: true
end
