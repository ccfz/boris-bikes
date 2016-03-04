require_relative 'docking_station'
require_relative 'garage'
require_relative 'bike.rb'
require_relative 'van'



station = DockingStation.new
bike1 = Bike.new
bike2 = Bike.new
bike3 = Bike.new
garage = Garage.new
van = Van.new

station.dock(bike1, true)

station.dock(bike2, true)

station.dock(bike3, true)

until van.full? == true || station.brokens_empty? == true do
  van.pickup(station.broken_bikes.pop)
end
station.broken_bikes

 p van.storage

until garage.full? == true || van.empty? == true do
  garage.pickup(van.storage.pop)
end

p garage.bikes
