class Airport < ApplicationRecord
  has_many :arriving_flights, class_name: 'Flight', foreign_key: 'to_airport'
  has_many :departing_flights, class_name: 'Flight', foreign_key: 'from_airport'
end
