class Student < ApplicationRecord
  enum status: { inactive: 0, active: 1 }
  devise :database_authenticatable, :rememberable, :validatable, :authentication_keys => [:nis]
end
