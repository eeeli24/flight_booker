# Create airports with codes as names
codes = ['LAX', 'SFO', 'ATL', 'ORD', 'JFK', 'DEN', 'DFW', 'LAS', 'SEA']
codes.each do |code|
  Airport.create!(name: code)
end

# Build 3 flights from each to each airport
airports = Airport.all
airports.each do |from_airport|
  airports.each do |to_airport|
    unless to_airport == from_airport
      3.times do
        flight = from_airport.departing_flights.build(
                   to_airport_id: to_airport.id, 
                   date: rand(4.days).seconds.from_now.beginning_of_hour)
        flight.save!
      end
    end
  end
end
