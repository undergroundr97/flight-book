class Passenger < ApplicationRecord
  has_many :bookings, foreign_key: "passenger_who_booked_id", class_name: "Booking"
end
