class Flight < ApplicationRecord
  belongs_to :from_airport, class_name: 'Airport'
  belongs_to :to_airport, class_name: 'Airport'
  has_many :bookings
  has_many :passengers, through: :bookings
  validates :from_airport, presence: true
  validates :to_airport, presence: true
  validates :duration, presence: true
  validates :departure, presence: true
end
