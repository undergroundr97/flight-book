json.extract! booking, :id, :booked_flight_id, :created_at, :updated_at
json.url booking_url(booking, format: :json)
