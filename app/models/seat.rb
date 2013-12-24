class Seat < ActiveRecord::Base
  attr_accessible :baggage, :flight_id, :name
  belongs_to :flight
  
end
