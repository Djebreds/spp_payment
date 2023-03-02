class Generation < ApplicationRecord
  has_many :budget_spps, dependent: :delete_all
  has_many :students, dependent: :delete_all

  validates :years, presence: true, length: { is: 9 }
end
