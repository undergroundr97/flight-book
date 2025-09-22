class AddForeignKeyToAirport < ActiveRecord::Migration[8.0]
  def change
    add_reference :airports, :departing_flights, null: true, foreign_key: { to_table: :flights }
    add_reference :airports, :arriving_flights, null: true, foreign_key: { to_table: :flights }
  end
end
