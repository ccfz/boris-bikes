require_relative './lib/docking_station'
require_relative './lib/van'

stat = DockingStation.new(7)
bike = Bike.new
van = Van.new
garage = Garage.new

stat.dock(bike)
p stat.bike


bikes = Array.new(5){Bike.new}

bikes.each do |bike|
  stat.dock(bike, 'broken')
end

van.load(stat.broken_bikes)

van.deliver

p van.bikes