class Generation < ApplicationRecord
  has_many :budget_spps, dependent: :delete_all
  has_many :students, dependent: :delete_all

  validates :years, presence: true, length: { is: 9 }

  trigger.after(:insert).declare("year1 text; year2 text;") do
    
  end
end
