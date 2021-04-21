class User < ApplicationRecord
  enum role: [:student, :organiser]
  has_many :bookings
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :role, presence: true
end

