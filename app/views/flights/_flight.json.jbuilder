json.extract! flight, :id, :departure, :arrival, :startdatetime, :flightduration, :created_at, :updated_at
json.url flight_url(flight, format: :json)
