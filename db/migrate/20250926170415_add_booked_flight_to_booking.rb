class AddBookedFlightToBooking < ActiveRecord::Migration[8.0]
  def change
    add_reference :bookings, :booked_flight, null: false, foreign_key: { to_table: :flights }
  end
end
