require_relative 'docking_station'
require_relative 'garage'
require_relative 'bike.rb'
require_relative 'van'



station = DockingStation.new
garage = Garage.new
van = Van.new



2.times {station.dock(Bike.new, true)}
2.times {station.dock(Bike.new, false)}

2.times {van.pickup(station.unload)}

 van.storage

garage.pickup(van.unload)

p garage.fix

p van.pickup(garage.unload)

