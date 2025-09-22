class RenameFlightAirportColumns < ActiveRecord::Migration[8.0]
  def change
    rename_column :flights, :departing_airport_id, :departure_airport_id
    rename_column :flights, :arriving_airport_id, :arrival_airport_id
  end
end
