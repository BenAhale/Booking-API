class Slot < ApplicationRecord
  belongs_to :day

  validates :time, presence: true
  validates :capacity, presence: true
end
