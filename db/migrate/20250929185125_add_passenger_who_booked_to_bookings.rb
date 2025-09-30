class AddPassengerWhoBookedToBookings < ActiveRecord::Migration[8.0]
  def change
    add_reference :bookings, :passenger_who_booked, null: true, foreign_key: { to_table: :passengers }
  end
end
