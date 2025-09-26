class AddFlightNameToFlight < ActiveRecord::Migration[8.0]
  def change
    add_column :flights, :flight_name, :string
  end
end
