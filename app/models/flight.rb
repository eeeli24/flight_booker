class Flight < ActiveRecord::Base
  belongs_to :from_airport, class_name: 'Airport'
  belongs_to :to_airport, class_name: 'Airport'
  has_many :bookings

  def self.search(params)
    Flight.where(from_airport_id: params[:from_airport],
                 to_airport_id: params[:to_airport],
                 date: correct_date(params[:date]))
  end

  def self.correct_date(date)
    unless date.nil?
      date = date.to_date
      date.beginning_of_day..date.end_of_day
    end
  end
end
