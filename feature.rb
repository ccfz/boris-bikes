require_relative './lib/docking_station'
require_relative './lib/van'
require_relative './lib/garage'

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

 p van.bikes

garage.broken_bikes(van.deliver)

 garage.storage

p van.load(garage.fixed_bikes)
