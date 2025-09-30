class ChangeBookingsIdColumnValue < ActiveRecord::Migration[8.0]
  def change
    change_column :passengers, :bookings_id, :integer, null: true
  end
end
