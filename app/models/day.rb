class Day < ApplicationRecord

  has_many :slots

  validates :date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :slot_length, presence: true
  validates :slot_capacity, presence: true
end
