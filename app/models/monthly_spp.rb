class MonthlySpp < ApplicationRecord
  has_one :budget_spp

  validates :year, :januari, :februari, :maret, :april, 
            :mei, :juni, :juli, :agustus, :september, :oktober, 
            :november, :desember, presence: true
end
