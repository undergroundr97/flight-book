class Booking < ApplicationRecord
  has_many :booked_flight, foreign_key: "booked_flight_id", class_name: "Flight"
end
