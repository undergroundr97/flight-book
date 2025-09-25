class AddFlightdateToFlight < ActiveRecord::Migration[8.0]
  def change
    add_column :flights, :flightstart, :datetime
    add_column :flights, :flightend, :datetime
  end
end
