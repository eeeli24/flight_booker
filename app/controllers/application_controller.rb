class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def number_of_passengers
    (1..4).collect { |x| [x, x] }
  end

  def flight_dates
    Flight.order('date ASC').pluck(:date).map { |x| [x.strftime("%B %d"), x.to_date] }.uniq
  end
end
