class FlightsController < ApplicationController

  def index
    @flights = Flight.search(params)
    @dates = flight_dates
    @passengers = number_of_passengers
    @passengers_selected = params[:passengers]
  end
end
