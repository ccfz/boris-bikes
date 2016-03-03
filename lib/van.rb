require_relative 'docking_station'

class Van
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def pickup(station)
    raise "There are no broken bikes in this station." if station.bikes.none? {|bike| bike.broken?}
    station.bikes.each {|bike| @bikes << bike if bike.broken?}
    station.bikes.delete_if {|bike| bike.broken?}
    @bikes
  end

end
