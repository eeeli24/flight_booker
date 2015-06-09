class Flight < ActiveRecord::Base
  belongs_to :from_airport, class_name: 'Airport'
  belongs_to :to_airport, class_name: 'Airport'

  def self.search(params)
    Flight.where('from_airport_id = ? AND to_airport_id = ? AND date LIKE ?',
                 params[:from_airport], params[:to_airport], "#{params[:date]}%")
  end
end
