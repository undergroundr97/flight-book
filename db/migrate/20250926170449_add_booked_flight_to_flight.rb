class AddBookedFlightToFlight < ActiveRecord::Migration[8.0]
  def change
    add_reference :flights, :booked_flight, null: true, foreign_key: { to_table: :bookings }
  end
end
