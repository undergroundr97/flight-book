# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


[ "NYC", "SP", 'CGU', 'CBW', 'FHC', 'FNS', 'AWS' ].each do |name|
  Airport.find_or_create_by!(code: name)
end

airport_ids = Airport.pluck(:id)

40.times do
  departure_id, arrival_id = airport_ids.sample(2)
  departure = Airport.find(departure_id)
  arrival = Airport.find(arrival_id)

  Flight.find_or_create_by!(
    arrival_airport: arrival,
    departure_airport: departure,
    flight_name: arrival.code + ' to ' + departure.code,
    flightstart: rand(1..2.days).seconds.from_now,
    flightend: rand(3..4.days).seconds.from_now
  )
end
