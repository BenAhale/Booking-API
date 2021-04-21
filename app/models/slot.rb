class Slot < ApplicationRecord
  belongs_to :day
  has_many :bookings

  validates :time, presence: true
  validates :capacity, presence: true
end
