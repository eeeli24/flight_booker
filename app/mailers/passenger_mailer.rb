class PassengerMailer < ApplicationMailer

  def booking_notification(passenger)
    @passenger = passenger
    @booking = Booking.find(passenger.booking_id)
    @flight = Flight.find(@booking.flight_id)
    @from = Airport.find(@flight.from_airport.id)
    @to = Airport.find(@flight.to_airport_id)
    mail(to: @passenger.email, subject: 'You have been added to a booking!')
  end
end
