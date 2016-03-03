require_relative 'docking_station'
require_relative 'garage'

class Van
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def station_pickup(station)
    station.bikes.each {|bike| @bikes << bike if bike.broken?}
    station.bikes.delete_if {|bike| bike.broken?}
    @bikes
  end

  def dropoff(garage)
    garage.bikes = @bikes
    @bikes = []
  end

  def garage_pickup(garage)
    @bikes << garage.bikes
  end

end
