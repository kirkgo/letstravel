json.extract! bus, :id, :bus_code, :extra_luggage, :seats, :seat_price, :created_at, :updated_at
json.url bus_url(bus, format: :json)
