class Booking < ApplicationRecord
  has_many :booked_flight, foreign_key: "booked_flight_id", class_name: "Flight"
  belongs_to :passenger_who_booked, foreign_key: "passenger_who_booked_id", class_name: "Passenger"
end
