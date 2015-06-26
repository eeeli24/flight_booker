class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    @flight = Flight.find(params[:flight_id])
    @num_of_passengers = params[:passengers_selected]
    @num_of_passengers.to_i.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to @booking
    else
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
    respond_to do |format|
      format.html
      format.xml  { render :xml => @booking }
      format.json { render :json =>
                    { :booking => @booking.as_json(only: [:id, :flight_id, :passengers]),
                      :passengers => @booking.passengers.as_json(only: [:name, :email]),
                      :flight  => @booking.flight.as_json(only: [:from_airport_id, :to_airport_id]) }}
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:num_of_passengers, :flight_id,
                                    passengers_attributes: [:name, :email])
  end
end
